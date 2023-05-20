import 'dart:async';

import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/constants/constants_for_back/constants.dart';
import 'package:cofee/custom_widgets/custom_text.dart';
import 'package:cofee/features/presentation/cart/widgets/checkout/widgets/modal_menu_in_cart/widget/list_view_modal_cart.dart';
import 'package:cofee/features/presentation/cart/widgets/checkout/widgets/modal_menu_in_cart/widget/product_cart_widget.dart';
import 'package:cofee/features/presentation/home/controller/home_view_cubit.dart';
import 'package:cofee/features/presentation/home/controller/home_view_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../../../../../home/widgets/main_view_widgets/category_card_widget.dart';

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
        DefaultTabController.of(tabContext!).animateTo(
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
