import 'dart:io';

import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/constants/constants_for_back/constants.dart';
import 'package:cofee/core/helpers/functions.dart';
import 'package:cofee/core/helpers/images.dart';
import 'package:cofee/custom_widgets/custom_button.dart';
import 'package:cofee/custom_widgets/custom_text.dart';
import 'package:cofee/features/presentation/cart/widgets/food_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scale_button/scale_button.dart';

import '../../home/controller/bottom_nav_nar_controller/cart_cubit.dart';
import '../../home/controller/bottom_nav_nar_controller/cart_state.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final day = DateTime.now().day;
  final month = BackConstants.months[DateTime.now().month];
  final weekDay = BackConstants.weekFullDays[DateTime.now().weekday];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartEmptyState) {
          context.read<CartCubit>().getItemsCart();
        } else if (state is HaveCartState) {
          return Scaffold(
            backgroundColor: ColorStyles.backgroundColor,
            body: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                _appBar(context),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 16.w,
                      right: 16.w,
                      top: 37.h,
                      bottom: 21.h,
                    ),
                    child: Row(
                      children: [
                        CustomText(
                          title: '$weekDay ($day $month)',
                          fontSize: 16.sp,
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            context
                                .read<CartCubit>()
                                .deleteCart();
                            context.read<CartCubit>().getItemsCart();
                          },
                          child: Container(
                            height: 32.h,
                            width: 93.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xffD30000),
                                width: 2.w,
                              ),
                              borderRadius: BorderRadius.circular(46.r),
                            ),
                            child: CustomText(
                              title: "Очистить",
                              color: const Color(0xffD30000),
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    width: size.width,
                    height: 500.h,
                    child: ListView.builder(
                      itemCount: state.countCart,
                      itemBuilder: (context, index) {
                        return FoodCard(
                          name: state.cartModel![index].name,
                          fatFullAmount: state
                            .cartModel![index].fatFullAmount,
                          weight: state.cartModel![index].weight,
                          proteinsFullAmount: state.cartModel![index].proteinsFullAmount,
                          carbohydratesFullAmount: state.
                              cartModel![index].carbohydratesFullAmount,
                          sizePrices: state.cartModel![index].sizePrices,
                          imageLink: state.cartModel![index].imageLink,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return Scaffold(
          backgroundColor: ColorStyles.backgroundColor,
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              _appBar(context),
              SliverToBoxAdapter(child: SizedBox(height: 142.h)),
              SliverToBoxAdapter(
                child: Image.asset(
                  Img.cart,
                  width: 80.h,
                  height: 80.h,
                ),
              ),
              SliverToBoxAdapter(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 16.h),
                    child: CustomText(
                      title: 'Корзина пустая',
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Center(
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 40.h, left: 16.h, right: 16.h),
                    child: CustomText(
                      title:
                          'Ваша корзину пуста, откройте Меню и выберите блюдо, которое \nвам по душе.',
                      fontSize: 16.h,
                      fontWeight: FontWeight.w500,
                      color: ColorStyles.greyTitleColor,
                      centerTitle: true,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(top: 24.h),
                  child: CustomButton(
                    title: 'Выбрать блюдо',
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const LoginView(),
                      //   ),
                      // );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  SliverAppBar _appBar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: ColorStyles.backgroundColor,
      toolbarHeight: Platform.isAndroid ? 80.h : 66.h,
      elevation: 1,
      expandedHeight: 10.h,
      // forceElevated: true,
      flexibleSpace: _topInfo(context),
    );
  }

  Padding _topInfo(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 68.h, left: 15.w, right: 15.w),
      child: Row(
        children: [
          CustomText(
            title: 'Корзина',
            fontWeight: FontWeight.w600,
            fontSize: 40,
          ),
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
}
