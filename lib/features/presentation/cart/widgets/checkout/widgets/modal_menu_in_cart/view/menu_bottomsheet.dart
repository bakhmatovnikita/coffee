import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/constants/constants_for_back/constants.dart';
import 'package:cofee/core/helpers/functions.dart';
import 'package:cofee/core/helpers/rect_getter.dart';
import 'package:cofee/custom_widgets/custom_text.dart';
import 'package:cofee/custom_widgets/push_access.dart';
import 'package:cofee/custom_widgets/push_error.dart';
import 'package:cofee/features/data/models/cart/cart_model.dart';
import 'package:cofee/features/domain/entiti/products/product_entiti.dart';
import 'package:cofee/features/domain/entiti/products/products_entiti.dart';
import 'package:cofee/features/presentation/auth/login_view/controller/login_view_cubit.dart';
import 'package:cofee/features/presentation/cart/widgets/checkout/widgets/modal_menu_in_cart/controller/list_view_modal_menu_cubit.dart';
import 'package:cofee/features/presentation/cart/widgets/checkout/widgets/modal_menu_in_cart/widget/list_view_modal_cart.dart';
import 'package:cofee/features/presentation/cart/widgets/checkout/widgets/modal_menu_in_cart/widget/product_cart_widget.dart';
import 'package:cofee/features/presentation/home/controller/home_view_cubit.dart';
import 'package:cofee/features/presentation/home/controller/home_view_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:octo_image/octo_image.dart';
import 'package:scale_button/scale_button.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../../../../../../domain/entiti/products/groups_entiti.dart';
import '../../../../../../home/widgets/main_view_widgets/category_card_widget.dart';
import '../../../../../../home/widgets/main_view_widgets/product_card_widget.dart';

class MenuBottomsheet extends StatefulWidget {
  const MenuBottomsheet({super.key});

  @override
  State<MenuBottomsheet> createState() => _MenuBottomsheetState();
}

class _MenuBottomsheetState extends State<MenuBottomsheet> {
  // AutoScrollController scrollController = AutoScrollController();
  // AutoScrollController customScrollController = AutoScrollController();
  SmartDialogController smartDialogController = SmartDialogController();

  // final day = DateTime.now().day;
  // final month = BackConstants.months[DateTime.now().month];
  // final weekDay = BackConstants.weekDaysForMenu[DateTime.now().weekday];

  // bool pauseRectGetterIndex = false;

  // final listViewKey = RectGetter.createGlobalKey();

  // Map<int, dynamic> itemsKeys = {};

  // final _categoriesController = StreamController<GroupsEntiti>();
  // final _appBarController = StreamController<double>();

  // late TabController _tabController;

  // void animateAndScrollTo(int index) async {
  //   pauseRectGetterIndex = true;
  //   _tabController.animateTo(
  //     index,
  //     duration: const Duration(seconds: 2),
  //   );
  //   await scrollController.scrollToIndex(
  //     index,
  //     preferPosition: AutoScrollPosition.begin,
  //     duration: const Duration(seconds: 2),
  //   );
  //   pauseRectGetterIndex = false;
  // }

  // bool onScrollNotification(
  //     ScrollNotification notification, List<GroupsEntiti> groups) {
  //   if (pauseRectGetterIndex) return true;

  //   int lastTabIndex = _tabController.length;
  //   List<int> visibleItems = getVisibleItemsIndex();

  //   bool reachLastTabIndex = visibleItems.isNotEmpty &&
  //       visibleItems.length <= 2 &&
  //       visibleItems.last == lastTabIndex;

  //   if (reachLastTabIndex) {
  //     _categoriesController.sink.add(groups[lastTabIndex]);
  //     _tabController.animateTo(
  //       lastTabIndex,
  //       // curve: Curves.easeInOutQuint,
  //       duration: const Duration(milliseconds: 100),
  //     );
  //   } else {
  //     int sumIndex = visibleItems.reduce(
  //       (value, element) => value + element,
  //     );
  //     int middleIndex = sumIndex ~/ visibleItems.length;

  //     if (_tabController.index != middleIndex) {
  //       _tabController.animateTo(
  //         middleIndex,
  //         // curve: Curves.easeInOutQuint,
  //         duration: const Duration(milliseconds: 100),
  //       );
  //       _categoriesController.sink.add(groups[middleIndex]);
  //     }
  //   }
  //   return false;
  // }

  // List<int> getVisibleItemsIndex() {
  //   Rect? rect = RectGetter.getRectFromKey(listViewKey);
  //   List<int> items = [];
  //   if (rect == null) return items;

  //   itemsKeys.forEach((index, key) {
  //     Rect? itemRect = RectGetter.getRectFromKey(key);
  //     if (itemRect == null) return;
  //     if (itemRect.top > rect.bottom) return;
  //     if (itemRect.bottom < rect.top) return;
  //     items.add(index);
  //   });

  //   return items;
  // }
  List<double> itemMenu = [];
  List<GlobalKey> itemCategory = [];
  late ScrollController scrollController;
  BuildContext? tabContext;
  ScrollController scrollControllerCategory = ScrollController();
  late TabController tabController;
  final day = DateTime.now().day;
  final month = BackConstants.months[DateTime.now().month];
  final weekDay = BackConstants.weekDays[DateTime.now().weekday];
  final stream = StreamController<int>();
  double num = 0.0;
  // Future<void> feetchMenu(
  //     Function() accessToken, Function() nomenclature) async {
  //   await accessToken();
  //   await nomenclature();
  // }
  

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(changeTabs);
    super.initState();
  }

  void changeTabs() {
    for (var i = 0; i < itemCategory.length; i++) {
      if (scrollController.offset >= itemMenu[i]) {
        DefaultTabController.of(tabContext!)!.animateTo(
          i,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        stream.sink.add(i);
      }
    }
  }

  scrollTo(int index) async {
    scrollController.removeListener(changeTabs);
    stream.sink.add(index);
    await Scrollable.ensureVisible(
      itemCategory[index].currentContext!,
      duration: const Duration(milliseconds: 600),
    );

    scrollController.addListener(changeTabs);
  }

//TODO Использовать cartCubit в отдельном кдассе для Корзины в модальном меню
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewCubit, HomeViewState>(
      builder: (context, state) {
        if (state is HomeViewLoadedState) {
          itemCategory = List.generate(
            state.productsEntiti.groups.length,
            (index) => GlobalKey(),
          );
          return DefaultTabController(
            length: state.productsEntiti.groups.length,
            child: Builder(builder: (context) {
              tabContext = context;
              return CustomScrollView(
                physics: const BouncingScrollPhysics(),
                controller: scrollController,
                slivers: [
                  SliverAppBar(
                    elevation: 0,
                    backgroundColor: ColorStyles.backgroundColor,
                    pinned: true,
                    title: CustomText(
                      title: 'Меню',
                      fontSize: 17,
                      color: ColorStyles.blackColor,
                      fontWeight: FontWeight.w600,
                    ),
                    centerTitle: true,
                    leading: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: ColorStyles.accentColor,
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: ListViewModalCart(),
                  ),
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    elevation: 0,
                    expandedHeight: 40,
                    backgroundColor: ColorStyles.backgroundColor,
                    pinned: true,
                    flexibleSpace: Padding(
                      padding: EdgeInsets.only(left: 16.w),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: CustomText(
                          title: 'Меню на $weekDay ( $day $month)',
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    elevation: 0,
                    backgroundColor: ColorStyles.backgroundColor,
                    pinned: true,
                    flexibleSpace: StreamBuilder<int>(
                      stream: stream.stream,
                      initialData: 0,
                      builder: (context, snapshot) {
                        return Align(
                          alignment: Alignment.center,
                          child: TabBar(
                            physics: const BouncingScrollPhysics(),
                            indicatorColor: Colors.transparent,
                            indicatorSize: TabBarIndicatorSize.label,
                            labelPadding: EdgeInsets.symmetric(horizontal: 4.w),
                            isScrollable: true,
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            onTap: (value) {
                              scrollTo(value);
                            },
                            tabs: List.generate(
                              itemCategory.length,
                              (index) => CategoryCardWidget(
                                groupsEntiti:
                                    state.productsEntiti.groups[index],
                                isSelected:
                                    snapshot.data! == index ? true : false,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.productsEntiti.groups.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => GetBoxOffset(
                            offset: (offset) {
                              itemMenu.add(offset.dy);
                              setState(() {});
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                children: [
                                  Padding(
                                    key: itemCategory[index],
                                    padding: EdgeInsets.only(
                                      left: 20.w,
                                      top: 20.h,
                                    ),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: CustomText(
                                        title: state
                                            .productsEntiti.groups[index].name,
                                        fontSize: 20.h,
                                      ),
                                    ),
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: state.productsEntiti.products
                                        .where((element) {
                                      return element.parentGroup ==
                                          state.productsEntiti.groups[index].id;
                                    }).length,
                                    itemBuilder: (context, indexProducts) =>
                                        ProductCartWidget(
                                      productEntiti: state
                                          .productsEntiti.products
                                          .where((element) =>
                                              element.parentGroup ==
                                              state.productsEntiti.groups[index]
                                                  .id)
                                          .toList()[indexProducts],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                  // _tarBarView(state.productsEntiti),
                  // _categoriesView(state.productsEntiti),
                ],
              );
            }),
          );
        }
        return Container(
          height: 758.h,
          decoration: BoxDecoration(
            color: const Color(0xffF3F3F3),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16.r),
              topLeft: Radius.circular(16.r),
            ),
          ),
          child: const Center(
            child: CircularProgressIndicator(
              color: Colors.orange,
            ),
          ),
        );
      },
    );
  }

//   SliverList _categoriesView(ProductsEntiti productsEntiti) {
//     return SliverList(
//       delegate: SliverChildBuilderDelegate(
//         addAutomaticKeepAlives: false,
//         addRepaintBoundaries: false,
//         childCount: productsEntiti.groups.length,
//         (context, index) {
//           itemsKeys[index] = RectGetter.createGlobalKey();
//           return _productWidget(context, index, productsEntiti);
//         },
//       ),
//     );
//   }

//   StreamBuilder<GroupsEntiti> _tarBarView(ProductsEntiti productsEntiti) {
//     return StreamBuilder<GroupsEntiti>(
//       stream: _categoriesController.stream,
//       initialData: productsEntiti.groups.first,
//       builder: (context, snapshot) {
//         return StreamBuilder<double>(
//           stream: _appBarController.stream,
//           initialData: 20.h,
//           builder: (context, newData) {
//             return SliverToBoxAdapter(
//               child: TabBar(
//                 overlayColor: MaterialStateProperty.all(
//                   Colors.transparent,
//                 ),
//                 indicatorPadding: EdgeInsets.symmetric(horizontal: 10.w),
//                 labelColor: Colors.white,
//                 unselectedLabelColor: Colors.grey[700],
//                 indicator: const BoxDecoration(color: Colors.transparent),
//                 isScrollable: true,
//                 controller: _tabController,
//                 onTap: (index) {
//                   VerticalScrollableTabBarStatus.setIndex(index);
//                   _categoriesController.sink.add(productsEntiti.groups[index]);
//                 },
//                 tabs: productsEntiti.groups.map(
//                   (element) {
//                     return _categoryWidget(
//                       element,
//                       snapshot.data! == element,
//                     );
//                   },
//                 ).toList(),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }

//   RectGetter _productWidget(
//       BuildContext context, int index, ProductsEntiti productsEntiti) {
//     return RectGetter(
//       key: itemsKeys[index],
//       child: AutoScrollTag(
//         key: ValueKey(index),
//         index: index,
//         controller: scrollController,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: EdgeInsets.only(
//                 left: 20.w,
//                 top: 20.h,
//               ),
//               child: CustomText(
//                 title: productsEntiti.groups[index].name,
//                 fontSize: 20.h,
//               ),
//             ),
//             ListView.builder(
//               physics: const NeverScrollableScrollPhysics(),
//               itemExtent: 170.71.h,
//               shrinkWrap: true,
//               addAutomaticKeepAlives: false,
//               padding: EdgeInsets.zero,
//               addRepaintBoundaries: false,
//               itemCount: productsEntiti.products.where((element) {
//                 return element.parentGroup == productsEntiti.groups[index].id;
//               }).length,
//               itemBuilder: (context, indexS) {
//                 var e = productsEntiti.products.where((element) {
//                   return element.parentGroup == productsEntiti.groups[index].id;
//                 }).toList()[indexS];
//                 return _productCardWidget(context, e);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Container _categoryWidget(GroupsEntiti groupsEntiti, bool selected) {
//     return Container(
//       height: 40.h,
//       alignment: Alignment.center,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(8.r),
//         border: Border.all(
//           color: selected ? ColorStyles.accentColor : Colors.transparent,
//           width: 2.h,
//         ),
//         color: ColorStyles.whiteColor,
//       ),
//       padding: EdgeInsets.symmetric(horizontal: 10.w),
//       child: CustomText(
//         title: groupsEntiti.name,
//         fontWeight: selected ? FontWeight.w500 : FontWeight.w500,
//         color: selected ? ColorStyles.blackColor : ColorStyles.greyTitleColor,
//         fontSize: 17,
//       ),
//     );
//   }

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
              child:
                  // child: productEntiti.imageLink.isNotEmpty
                  //     ? OctoImage(
                  //         image: CachedNetworkImageProvider(
                  //           productEntiti.imageLink[0],
                  //         ),
                  //         width: 155.w,
                  //         placeholderBuilder: OctoPlaceholder.blurHash(
                  //           'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
                  //         ),
                  //         memCacheHeight: 0,
                  //         memCacheWidth: 0,
                  //         filterQuality: FilterQuality.low,
                  //         fit: BoxFit.cover,
                  //       )
                  //     :
                  SizedBox(
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
                              context.read<ListViewCubit>().addToModalCart(
                                    CartModel(
                                      name: productEntiti.name,
                                      fatFullAmount: productEntiti.fatFullAmount
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
                                      productId: productEntiti.id,
                                      isSelected: true,
                                    ),
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

//   @override
//   // TODO: implement wantKeepAlive
//   bool get wantKeepAlive => true;

// }
// class VerticalScrollableTabBarStatus {
//   static bool isOnTap = false;
//   static int isOnTapIndex = 0;

//   static void setIndex(int index) {
//     VerticalScrollableTabBarStatus.isOnTap = true;
//     VerticalScrollableTabBarStatus.isOnTapIndex = index;
//   }
}

class GetBoxOffset extends StatefulWidget {
  final Widget child;
  final Function(Offset offset) offset;
  const GetBoxOffset({super.key, required this.child, required this.offset});

  @override
  State<GetBoxOffset> createState() => _GetBoxOffsetState();
}

class _GetBoxOffsetState extends State<GetBoxOffset> {
  GlobalKey widgetKey = GlobalKey();
  Offset offset = const Offset(0.0, 0.0);
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final box = widgetKey.currentContext!.findRenderObject() as RenderBox;
      offset = box.localToGlobal(Offset.zero);
      widget.offset(offset);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: widgetKey,
      child: widget.child,
    );
  }
}
