import 'dart:async';

import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/core/helpers/images.dart';
import 'package:cofee/features/home/presentation/views/body_view.dart';
import 'package:cofee/features/home/presentation/views/cart_view.dart';
import 'package:cofee/features/home/presentation/views/home.dart';
import 'package:cofee/features/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavView extends StatefulWidget {
  const BottomNavView({super.key});

  @override
  State<BottomNavView> createState() => _BottomNavViewState();
}

class _BottomNavViewState extends State<BottomNavView>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final _streamController = StreamController<int>();

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      _streamController.sink.add(_tabController.index);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const HomeView(),
          const CartView(),
          BodyView(
            onChangeView: (index) {
              _streamController.sink.add(index);
              _tabController.animateTo(index);
            },
          ),
        ],
      ),
      bottomNavigationBar: StreamBuilder<int>(
          stream: _streamController.stream,
          initialData: 0,
          builder: (context, snapshot) {
            return BottomNavigationBar(
              showSelectedLabels: false,
              backgroundColor: ColorStyles.whiteColor,
              showUnselectedLabels: false,
              selectedItemColor: ColorStyles.accentColor,
              unselectedItemColor: ColorStyles.greyTitleColor,
              onTap: (index) {
                _streamController.sink.add(index);
                _tabController.animateTo(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      SvgPicture.asset(
                        snapshot.data! == 0
                            ? SvgImg.houseFill
                            : SvgImg.houseNotFill,
                        width: 20.73.h,
                        height: 18.14.h,
                        color: snapshot.data! == 0
                            ? ColorStyles.accentColor
                            : ColorStyles.greyTitleColor,
                      ),
                      SizedBox(height: 5.h),
                      CustomText(
                        title: 'Главная',
                        fontWeight: FontWeight.w500,
                        fontSize: 12.h,
                        color: snapshot.data! == 0
                            ? ColorStyles.accentColor
                            : ColorStyles.greyTitleColor,
                      ),
                    ],
                  ),
                  label: 'Главная',
                ),
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      SvgPicture.asset(
                        snapshot.data! == 1 ? SvgImg.cartFill : SvgImg.cart,
                        width: 19.7.h,
                        height: 16.9.h,
                        color: snapshot.data! == 1
                            ? ColorStyles.accentColor
                            : ColorStyles.greyTitleColor,
                      ),
                      SizedBox(height: 5.h),
                      CustomText(
                        title: 'Корзина',
                        fontWeight: FontWeight.w500,
                        fontSize: 12.h,
                        color: snapshot.data! == 1
                            ? ColorStyles.accentColor
                            : ColorStyles.greyTitleColor,
                      ),
                    ],
                  ),
                  label: 'Корзина',
                ),
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      SvgPicture.asset( SvgImg.heart,
                        width: 17.15.h,
                        height: 15.88.h,
                        color: snapshot.data! == 2
                            ? ColorStyles.accentColor
                            : ColorStyles.greyTitleColor,
                      ),
                      SizedBox(height: 5.h),
                      CustomText(
                        title: 'Моё тело',
                        fontWeight: FontWeight.w500,
                        fontSize: 12.h,
                        color: snapshot.data! == 2
                            ? ColorStyles.accentColor
                            : ColorStyles.greyTitleColor,
                      ),
                    ],
                  ),
                  label: 'Мое тело',
                ),
              ],
            );
          }),
    );
  }
}
