import 'dart:async';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/constants/constants_for_back/constants.dart';
import 'package:cofee/core/helpers/functions.dart';
import 'package:cofee/core/helpers/rect_getter.dart';
import 'package:cofee/custom_widgets/push_access.dart';
import 'package:cofee/custom_widgets/push_error.dart';
import 'package:cofee/features/data/models/cart/cart_model.dart';
import 'package:cofee/features/domain/entiti/products/groups_entiti.dart';
import 'package:cofee/features/domain/entiti/products/product_entiti.dart';
import 'package:cofee/features/domain/entiti/products/products_entiti.dart';
import 'package:cofee/features/presentation/auth/login_view/controller/login_view_cubit.dart';
import 'package:cofee/features/presentation/auth/login_view/controller/login_view_state.dart';
import 'package:cofee/features/presentation/home/controller/bottom_nav_nar_controller/cart_cubit.dart';
import 'package:cofee/features/presentation/home/controller/home_view_cubit.dart';
import 'package:cofee/features/presentation/home/controller/home_view_state.dart';
import 'package:cofee/features/presentation/home/widgets/calendar_select_modal.dart';
import 'package:cofee/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/svg.dart';
import 'package:octo_image/octo_image.dart';
import 'package:scale_button/scale_button.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  final day = DateTime.now().day;
  final month = BackConstants.months[DateTime.now().month];
  final weekDay = BackConstants.weekDays[DateTime.now().weekday];

  AutoScrollController scrollController = AutoScrollController();
  AutoScrollController customScrollController = AutoScrollController();
  SmartDialogController smartDialogController = SmartDialogController();

  bool pauseRectGetterIndex = false;

  final listViewKey = RectGetter.createGlobalKey();

  Map<int, dynamic> itemsKeys = {};

  final _categoriesController = StreamController<GroupsEntiti>();
  final _appBarController = StreamController<double>();

  late TabController _tabController;

  void animateAndScrollTo(int index) async {
    pauseRectGetterIndex = true;
    _tabController.animateTo(
      index,
      duration: const Duration(seconds: 2),
    );
    await scrollController.scrollToIndex(
      index,
      preferPosition: AutoScrollPosition.begin,
      duration: const Duration(seconds: 2),
    );
    pauseRectGetterIndex = false;
  }

  bool onScrollNotification(
      ScrollNotification notification, List<GroupsEntiti> groups) {
    if (pauseRectGetterIndex) return true;

    int lastTabIndex = _tabController.length;
    List<int> visibleItems = getVisibleItemsIndex();

    bool reachLastTabIndex = visibleItems.isNotEmpty &&
        visibleItems.length <= 2 &&
        visibleItems.last == lastTabIndex;

    if (reachLastTabIndex) {
      _categoriesController.sink.add(groups[lastTabIndex]);
      _tabController.animateTo(
        lastTabIndex,
        // curve: Curves.easeInOutQuint,
        duration: const Duration(milliseconds: 100),
      );
    } else {
      int sumIndex = visibleItems.reduce(
        (value, element) => value + element,
      );
      int middleIndex = sumIndex ~/ visibleItems.length;

      if (_tabController.index != middleIndex) {
        _tabController.animateTo(
          middleIndex,
          // curve: Curves.easeInOutQuint,
          duration: const Duration(milliseconds: 100),
        );
        _categoriesController.sink.add(groups[middleIndex]);
      }
    }
    return false;
  }

  List<int> getVisibleItemsIndex() {
    Rect? rect = RectGetter.getRectFromKey(listViewKey);
    List<int> items = [];
    if (rect == null) return items;

    itemsKeys.forEach((index, key) {
      Rect? itemRect = RectGetter.getRectFromKey(key);
      if (itemRect == null) return;
      if (itemRect.top > rect.bottom) return;
      if (itemRect.bottom < rect.top) return;
      items.add(index);
    });

    return items;
  }

  @override
  void initState() {
    _tabController = TabController(length: 8, vsync: this);
    _tabController.addListener(() {
      if (VerticalScrollableTabBarStatus.isOnTap) {
        animateAndScrollTo(VerticalScrollableTabBarStatus.isOnTapIndex);
        VerticalScrollableTabBarStatus.isOnTap = false;
      }
    });
    scrollController.addListener(() {
      if (scrollController.position.pixels > 20.h * 2) {
        if (scrollController.position.pixels < 160.h) {
          _appBarController.sink.add((scrollController.position.pixels / 2).h);
        } else {
          _appBarController.sink.add((160.h / 2).h);
        }
      } else {
        _appBarController.sink.add(20.h);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewCubit, HomeViewState>(
      builder: (context, state) {
        if (state is HomeViewEmptyState) {
          context.read<LoginViewCubit>().saveToken("access_token");
          context.read<HomeViewCubit>().fetchProducts('nomenclature');
        } else if (state is HomeViewLoadedState) {
          return Scaffold(
            backgroundColor: ColorStyles.backgroundColor,
            body: RectGetter(
              key: listViewKey,
              child: NotificationListener<ScrollNotification>(
                onNotification: (scrollNotification) => onScrollNotification(
                  scrollNotification,
                  state.productsEntiti.groups,
                ),
                child: _body(state.productsEntiti),
              ),
            ),
          );
        }
        return Scaffold(
          body: BlocListener<LoginViewCubit, LoginViewState>(
            listener: (context2, state2) async {
              print('STATE2: ${state2}');
              if (state2 is LoginViewSavedState &&
                  state is HomeViewEmptyState) {
                await context.read<LoginViewCubit>().saveToken("access_token");
                await context.read<HomeViewCubit>().fetchProducts('nomenclature');
              }
            },
            child: const Center(
              child: CircularProgressIndicator(
                color: Colors.orange,
              ),
            ),
          ),
        );
      },
    );
  }

  CustomScrollView _body(ProductsEntiti productsEntiti) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      controller: scrollController,
      slivers: [
        _appBar(),
        _tarBarView(productsEntiti),
        _categoriesView(productsEntiti),
        SliverToBoxAdapter(child: SizedBox(height: 300.h)),
      ],
    );
  }

  SliverList _categoriesView(ProductsEntiti productsEntiti) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        addAutomaticKeepAlives: false,
        addRepaintBoundaries: false,
        childCount: productsEntiti.groups.length,
        (context, index) {
          itemsKeys[index] = RectGetter.createGlobalKey();
          return _productWidget(context, index, productsEntiti);
        },
      ),
    );
  }

  SliverAppBar _appBar() {
    return SliverAppBar(
      backgroundColor: ColorStyles.backgroundColor,
      toolbarHeight: Platform.isAndroid ? 180.h : 150.h,
      elevation: 1,
      expandedHeight: 10.h,
      // forceElevated: true,
      flexibleSpace: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _topInfo(),
          Padding(
            padding: EdgeInsets.only(top: 17.h, left: 15.w),
            child: GestureDetector(
              onTap: () => calendarSelectModal(
                  context, Offset(15.w, 170.5.h), (index) {}, 0),
              child: CustomText(
                title: 'Меню на $day $month ($weekDay)',
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.h, left: 15.w, bottom: 15.h),
            child: GestureDetector(
              onTap: () => calendarSelectModal(
                  context, Offset(15.w, 185.h), (index) {}, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.calendar_month_rounded,
                    color: ColorStyles.accentColor,
                    size: 16.h,
                  ),
                  SizedBox(width: 4.w),
                  CustomText(
                    title: 'Выбрать день',
                    fontSize: 16.h,
                    color: ColorStyles.accentColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  StreamBuilder<GroupsEntiti> _tarBarView(ProductsEntiti productsEntiti) {
    return StreamBuilder<GroupsEntiti>(
        stream: _categoriesController.stream,
        initialData: productsEntiti.groups.first,
        builder: (context, snapshot) {
          return StreamBuilder<double>(
              stream: _appBarController.stream,
              initialData: 20.h,
              builder: (context, newData) {
                return SliverAppBar(
                  backgroundColor: ColorStyles.backgroundColor,
                  toolbarHeight: newData.data!,
                  pinned: true,
                  flexibleSpace: AnimatedAlign(
                    duration: const Duration(milliseconds: 1000),
                    alignment: newData.data! < 160.h
                        ? Alignment.bottomCenter
                        : Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 15.h),
                      child: TabBar(
                        overlayColor: MaterialStateProperty.all(
                          Colors.transparent,
                        ),
                        indicatorPadding:
                            EdgeInsets.symmetric(horizontal: 10.w),
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.grey[700],
                        indicator:
                            const BoxDecoration(color: Colors.transparent),
                        isScrollable: true,
                        controller: _tabController,
                        onTap: (index) {
                          VerticalScrollableTabBarStatus.setIndex(index);
                          _categoriesController.sink
                              .add(productsEntiti.groups[index]);
                        },
                        tabs: productsEntiti.groups.map(
                          (element) {
                            return _categoryWidget(
                              element,
                              snapshot.data! == element,
                            );
                          },
                        ).toList(),
                      ),
                    ),
                  ),
                );
              });
        });
  }

  RectGetter _productWidget(
      BuildContext context, int index, ProductsEntiti productsEntiti) {
    return RectGetter(
      key: itemsKeys[index],
      child: AutoScrollTag(
        key: ValueKey(index),
        index: index,
        controller: scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 20.w,
                top: 20.h,
              ),
              child: CustomText(
                title: productsEntiti.groups[index].name,
                fontSize: 20.h,
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemExtent: 170.71.h,
              shrinkWrap: true,
              addAutomaticKeepAlives: false,
              padding: EdgeInsets.zero,
              addRepaintBoundaries: false,
              itemCount: productsEntiti.products.where((element) {
                return element.parentGroup == productsEntiti.groups[index].id;
              }).length,
              itemBuilder: (context, indexS) {
                var e = productsEntiti.products.where((element) {
                  return element.parentGroup == productsEntiti.groups[index].id;
                }).toList()[indexS];
                return _productCardWidget(context, e);
              },
            ),
          ],
        ),
      ),
    );
  }

  ScaleButton _productCardWidget(
      BuildContext context, ProductEntiti productEntiti) {
    return ScaleButton(
      onTap: () =>
          Functions(context).showProductEntityBottomsheet(productEntiti),
      bound: 0.02,
      duration: const Duration(milliseconds: 100),
      child: Container(
        padding: EdgeInsets.zero,
        height: 155.71.h,
        decoration: BoxDecoration(
          color: ColorStyles.whiteColor,
          borderRadius: BorderRadius.circular(16.r),
        ),
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(
          horizontal: 15.w,
          vertical: 7.5.h,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                bottomLeft: Radius.circular(16.r),
              ),
              child: productEntiti.imageLink.isNotEmpty
                  ? OctoImage(
                      image: CachedNetworkImageProvider(
                        productEntiti.imageLink[0],
                      ),
                      width: 155.w,
                      placeholderBuilder: OctoPlaceholder.blurHash(
                        'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
                      ),
                      memCacheHeight: 0,
                      memCacheWidth: 0,
                      filterQuality: FilterQuality.low,
                      fit: BoxFit.cover,
                    )
                  : SizedBox(
                      width: 155.w,
                      child: Image.asset(
                        'assets/images/splash.png',
                        width: 155.w / 2,
                        height: 155.w / 2,
                      ),
                    ),
            ),
            Padding(
              padding: EdgeInsets.all(14.86.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    child: CustomText(
                      title: productEntiti.name,
                      fontSize: 17.h,
                      fontWeight: FontWeight.w600,
                      maxLength: 13,
                    ),
                  ),
                  CustomText(
                    title:
                        '${productEntiti.fatFullAmount.toStringAsFixed(2)} калл',
                    fontSize: 14.h,
                    fontWeight: FontWeight.w400,
                  ),
                  CustomText(
                    title: '${productEntiti.weight.toStringAsFixed(1)} гр',
                    fontSize: 14.h,
                    fontWeight: FontWeight.w400,
                  ),
                  CustomText(
                    title:
                        'БЖУ: ${productEntiti.proteinsFullAmount.toStringAsFixed(1)}/${productEntiti.fatFullAmount.toStringAsFixed(1)}/${productEntiti.carbohydratesFullAmount.toStringAsFixed(1)}',
                    fontSize: 14.h,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(
                    width: 151.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          title:
                              '${productEntiti.sizePrices[0].price.currentPrice} ₽'
                                  .toUpperCase(),
                          fontSize: 20.h,
                          fontWeight: FontWeight.w600,
                          color: ColorStyles.accentColor,
                        ),
                        GestureDetector(
                          onTap: () {
                            try {
                              context.read<CartCubit>().addToCartItem(
                                    CartModel(
                                        name: productEntiti.name,
                                        fatFullAmount: productEntiti
                                            .fatFullAmount
                                            .toStringAsFixed(2),
                                        weight: productEntiti.weight,
                                        proteinsFullAmount: productEntiti
                                            .proteinsFullAmount
                                            .toStringAsFixed(2),
                                        carbohydratesFullAmount: productEntiti
                                            .carbohydratesFullAmount
                                            .toStringAsFixed(2),
                                        sizePrices: productEntiti
                                            .sizePrices[0].price.currentPrice,
                                        imageLink: productEntiti.imageLink,
                                        count: 1,
                                        productId: productEntiti.id),
                                  );
                              SmartDialog.show(
                                animationType: SmartAnimationType.fade,
                                maskColor: Colors.transparent,
                                controller: smartDialogController,
                                displayTime: const Duration(seconds: 3),
                                clickMaskDismiss: false,
                                usePenetrate: true,
                                builder: (context) => const SafeArea(
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: PushAccess(
                                      title: 'Товар добавлен в корзину',
                                      subTitle: 'Вы можете оформить заказ!',
                                    ),
                                  ),
                                ),
                              );
                            } catch (e) {
                              SmartDialog.show(
                                animationType: SmartAnimationType.fade,
                                maskColor: Colors.transparent,
                                displayTime: const Duration(seconds: 3),
                                clickMaskDismiss: false,
                                usePenetrate: true,
                                builder: (context) => const SafeArea(
                                  child: Align(
                                    alignment: Alignment.topCenter,
                                    child: PushError(
                                      title: 'Что-то пошло не так',
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                          child: SizedBox(
                            height: 30.h,
                            width: 30.w,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: SvgPicture.asset(
                                'assets/icons/plus.svg',
                                width: 16.83.h,
                                height: 16.83.h,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _categoryWidget(GroupsEntiti groupsEntiti, bool selected) {
    return Container(
      height: 40.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: selected ? ColorStyles.accentColor : Colors.transparent,
          width: 2.h,
        ),
        color: ColorStyles.whiteColor,
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: CustomText(
        title: groupsEntiti.name,
        fontWeight: selected ? FontWeight.w500 : FontWeight.w500,
        color: selected ? ColorStyles.blackColor : ColorStyles.greyTitleColor,
        fontSize: 17,
      ),
    );
  }

  Padding _topInfo() {
    return Padding(
      padding: EdgeInsets.only(top: 68.h, left: 15.w, right: 15.w),
      child: Row(
        children: [
          CustomText(title: 'Меню', fontWeight: FontWeight.w600, fontSize: 40),
          const Expanded(child: SizedBox()),
          ScaleButton(
            onTap: () => Functions(context).showModalNotifications(),
            bound: 0.05,
            duration: const Duration(milliseconds: 100),
            child: Container(
              width: 40.h,
              height: 40.h,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: ColorStyles.whiteColor,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                'assets/icons/bell.svg',
                width: 19.55.w,
                height: 21.08.h,
              ),
            ),
          ),
          SizedBox(width: 16.w),
          ScaleButton(
            onTap: () => Functions(context).showProfileUserBottomSheet(),
            bound: 0.05,
            duration: const Duration(milliseconds: 100),
            child: Container(
              width: 40.h,
              height: 40.h,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                // color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                'assets/images/avatar.png',
                width: 40.w,
                height: 40.h,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class VerticalScrollableTabBarStatus {
  static bool isOnTap = false;
  static int isOnTapIndex = 0;

  static void setIndex(int index) {
    VerticalScrollableTabBarStatus.isOnTap = true;
    VerticalScrollableTabBarStatus.isOnTapIndex = index;
  }
}
