import 'dart:async';
import 'dart:io';

import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/core/helpers/functions.dart';
import 'package:cofee/core/helpers/rect_getter.dart';
import 'package:cofee/core/models/category.dart';
import 'package:cofee/core/models/product.dart';
import 'package:cofee/features/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scale_button/scale_button.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  final List<Category> _categories = [
    // Category(0, 'Все'),
    Category(1, 'Десерты и выпечка'),
    Category(2, 'Салаты'),
    Category(3, 'Первые блюда'),
    Category(4, 'Вторые блюда'),
  ];

  AutoScrollController scrollController = AutoScrollController();
  AutoScrollController customScrollController = AutoScrollController();

  bool pauseRectGetterIndex = false;

  final listViewKey = RectGetter.createGlobalKey();

  Map<int, dynamic> itemsKeys = {};

  final List<Product> _products = [
    Product(
        1, 'Круассан', 150, 180, '12/15/40', 200, 'assets/images/Frame 1.png'),
    Product(
        1, 'Круассан', 150, 180, '12/15/40', 300, 'assets/images/Frame 2.png'),
    Product(
        1, 'Круассан', 150, 180, '12/15/40', 400, 'assets/images/Frame 3.png'),
    Product(
        2, 'Круассан', 150, 180, '12/15/40', 500, 'assets/images/Frame 1.png'),
    Product(
        2, 'Круассан', 150, 180, '12/15/40', 600, 'assets/images/Frame 2.png'),
    Product(
        2, 'Круассан', 150, 180, '12/15/40', 700, 'assets/images/Frame 3.png'),
    Product(
        2, 'Круассан', 150, 180, '12/15/40', 800, 'assets/images/Frame 1.png'),
    Product(
        3, 'Круассан', 150, 180, '12/15/40', 900, 'assets/images/Frame 2.png'),
    Product(
        3, 'Круассан', 150, 180, '12/15/40', 1000, 'assets/images/Frame 2.png'),
    Product(
        3, 'Круассан', 150, 180, '12/15/40', 2000, 'assets/images/Frame 2.png'),
    Product(
        4, 'Круассан', 150, 180, '12/15/40', 3000, 'assets/images/Frame 2.png'),
    Product(
        4, 'Круассан', 150, 180, '12/15/40', 4000, 'assets/images/Frame 2.png'),
    Product(
        4, 'Круассан', 150, 180, '12/15/40', 5000, 'assets/images/Frame 2.png'),
    Product(
        4, 'Круассан', 150, 180, '12/15/40', 6000, 'assets/images/Frame 2.png'),
    Product(
        4, 'Круассан', 150, 180, '12/15/40', 7000, 'assets/images/Frame 2.png'),
  ];

  final _categoriesController = StreamController<Category>();
  final _appBarController = StreamController<double>();

  late TabController _tabController;

  void animateAndScrollTo(int index) async {
    pauseRectGetterIndex = true;
    _tabController.animateTo(
      index,
      curve: Curves.easeInOutQuint,
      duration: const Duration(milliseconds: 1000),
    );
    await scrollController.scrollToIndex(
      index,
      preferPosition: AutoScrollPosition.begin,
      duration: const Duration(milliseconds: 1000),
    );
    pauseRectGetterIndex = false;
  }

  bool onScrollNotification(ScrollNotification notification) {
    if (pauseRectGetterIndex) return true;

    int lastTabIndex = _tabController.length;
    List<int> visibleItems = getVisibleItemsIndex();

    bool reachLastTabIndex = visibleItems.isNotEmpty &&
        visibleItems.length <= 2 &&
        visibleItems.last == lastTabIndex;

    if (reachLastTabIndex) {
      _categoriesController.sink.add(_categories[lastTabIndex]);
      _tabController.animateTo(
        lastTabIndex,
        curve: Curves.easeInOutQuint,
        duration: const Duration(milliseconds: 1000),
      );
    } else {
      int sumIndex = visibleItems.reduce(
        (value, element) => value + element,
      );
      int middleIndex = sumIndex ~/ visibleItems.length;

      if (_tabController.index != middleIndex) {
        _tabController.animateTo(
          middleIndex,
          curve: Curves.easeInOutQuint,
          duration: const Duration(milliseconds: 1000),
        );
        _categoriesController.sink.add(_categories[middleIndex]);
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
    _tabController = TabController(length: _categories.length, vsync: this);
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
        }
      } else {
        _appBarController.sink.add(20.h);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.backgroundColor,
      body: RectGetter(
        key: listViewKey,
        child: NotificationListener<ScrollNotification>(
          onNotification: onScrollNotification,
          child: _body(),
        ),
      ),
    );
  }

  StreamBuilder _body() {
    return StreamBuilder<Category>(
      stream: _categoriesController.stream,
      initialData: _categories.first,
      builder: (context, snapshot) {
        return CustomScrollView(
          physics: const BouncingScrollPhysics(),
          controller: scrollController,
          slivers: [
            _appBar(),
            _tarBarView(snapshot),
            _categoriesView(),
            SliverToBoxAdapter(child: SizedBox(height: 300.h)),
          ],
        );
      },
    );
  }

  SliverToBoxAdapter _categoriesView() {
    return SliverToBoxAdapter(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          itemsKeys[index] = RectGetter.createGlobalKey();
          return _productWidget(context, index);
        },
      ),
    );
  }

  SliverAppBar _appBar() {
    return SliverAppBar(
      backgroundColor: ColorStyles.backgroundColor,
      toolbarHeight: Platform.isAndroid ? 145.h : 100.h,
      elevation: 1,
      expandedHeight: 10.h,
      // forceElevated: true,
      flexibleSpace: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _topInfo(),
          Padding(
            padding: EdgeInsets.only(top: 17.h, left: 15.w, bottom: 15.h),
            child: CustomText(
              title: 'Меню на 12 июля (Вт)',
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  StreamBuilder<double> _tarBarView(AsyncSnapshot<Category> snapshot) {
    return StreamBuilder<double>(
        stream: _appBarController.stream,
        initialData: 20.h,
        builder: (context, newData) {
          return SliverAppBar(
            backgroundColor: ColorStyles.backgroundColor,
            toolbarHeight: newData.data!,
            pinned: true,
            flexibleSpace: AnimatedAlign(
              duration: const Duration(milliseconds: 500),
              alignment: newData.data! < 160.h
                  ? Alignment.bottomCenter
                  : Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 15.h),
                child: TabBar(
                  overlayColor: MaterialStateProperty.all(
                    Colors.transparent,
                  ),
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 10.w),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey[700],
                  indicator: const BoxDecoration(color: Colors.transparent),
                  isScrollable: true,
                  controller: _tabController,
                  onTap: (index) {
                    VerticalScrollableTabBarStatus.setIndex(index);
                    _categoriesController.sink.add(_categories[index]);
                  },
                  tabs: _categories.map(
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
  }

  RectGetter _productWidget(BuildContext context, int index) {
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
                title: _categories[index].label,
                fontSize: 20.h,
              ),
            ),
            Column(
              children: _products
                  .where(
                    (element) => element.categroryId == _categories[index].id,
                  )
                  .map((e) => _productCardWidget(context, e))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  ScaleButton _productCardWidget(BuildContext context, Product product) {
    return ScaleButton(
      onTap: () => Functions(context).showModalNotifications(),
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
              child: Image.asset(
                product.image,
                width: 160.w,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(14.86.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    title: product.label,
                    fontSize: 17.h,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: 10.h),
                  CustomText(
                    title: '${product.callories} калл',
                    fontSize: 14.h,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(height: 4.h),
                  CustomText(
                    title: '${product.weight} гр',
                    fontSize: 14.h,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(height: 4.h),
                  CustomText(
                    title: 'БЖУ: ${product.proteins}',
                    fontSize: 14.h,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    width: 151.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          title: '${product.price} ₽'.toUpperCase(),
                          fontSize: 20.h,
                          fontWeight: FontWeight.w600,
                          color: ColorStyles.accentColor,
                        ),
                        SvgPicture.asset(
                          'assets/icons/plus.svg',
                          width: 16.83.h,
                          height: 16.83.h,
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

  Container _categoryWidget(Category category, bool selected) {
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
        title: category.label,
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
            onTap: () => Functions(context).showModalNotifications(),
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
