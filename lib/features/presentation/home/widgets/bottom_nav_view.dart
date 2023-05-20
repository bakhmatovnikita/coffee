import 'dart:async';

import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/core/helpers/images.dart';
import 'package:cofee/custom_widgets/custom_text.dart';
import 'package:cofee/features/presentation/cart/view/cart_view.dart';
import 'package:cofee/features/presentation/home/controller/bottom_nav_nar_controller/cart_cubit.dart';
import 'package:cofee/features/presentation/home/controller/bottom_nav_nar_controller/cart_state.dart';
import 'package:cofee/features/presentation/home/view/main_home.dart';
import 'package:cofee/features/presentation/home/widgets/body_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavView extends StatefulWidget {
  String? organizationId;
  BottomNavView({super.key, this.organizationId});

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
          MainHome(
            organizationId: widget.organizationId,
          ),
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
              onTap: (index) async {
                _streamController.sink.add(index);
                _tabController.animateTo(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      SizedBox(
                        width: 24.73.h,
                        height: 22.14.h,
                        child: SvgPicture.asset(
                          snapshot.data! == 0
                              ? SvgImg.houseFill
                              : SvgImg.houseNotFill,
                          color: snapshot.data! == 0
                              ? ColorStyles.accentColor
                              : ColorStyles.greyTitleColor,
                        ),
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
                  icon: GestureDetector(
                    child: Column(
                      children: [
                        SizedBox(
                          width: 23.7.h,
                          height: 20.9.h,
                          child: Stack(
                            children: [
                              SvgPicture.asset(
                                snapshot.data! == 1
                                    ? SvgImg.cartFill
                                    : SvgImg.cart,
                                color: snapshot.data! == 1
                                    ? ColorStyles.accentColor
                                    : ColorStyles.greyTitleColor,
                              ),
                              BlocBuilder<CartCubit, CartState>(
                                builder: (context, state) {
                                  if (state is CartEmptyState) {
                                    context.read<CartCubit>().getItemsCart();
                                  } else if (state is HaveCartState) {
                                    return Align(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                        height: 8.h,
                                        width: 8.w,
                                        decoration: BoxDecoration(
                                          color: ColorStyles.accentColor,
                                          borderRadius:
                                              BorderRadius.circular(4.r),
                                        ),
                                        child: Align(
                                            alignment: Alignment.center,
                                            child: CustomText(
                                              title: state.countCart.toString(),
                                              color: Colors.white,
                                              fontSize: 6,
                                            )),
                                      ),
                                    );
                                  }
                                  return Container();
                                },
                              )
                            ],
                          ),
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
                  ),
                  label: 'Корзина',
                ),
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      SvgPicture.asset(
                        SvgImg.heart,
                        width: 21.15.h,
                        height: 19.88.h,
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
