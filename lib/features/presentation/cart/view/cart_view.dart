import 'dart:io';

import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/constants/constants_for_back/constants.dart';
import 'package:cofee/core/helpers/functions.dart';
import 'package:cofee/core/helpers/images.dart';
import 'package:cofee/custom_widgets/custom_button.dart';
import 'package:cofee/custom_widgets/custom_text.dart';
import 'package:cofee/features/data/models/cart/cart_model.dart';
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
  double totalAmount = 0;
  double totalWeigth = 0;

  void calculateTotalAmount(List<CartModel> list) {
    double result = 0;

    list.forEach((element) {
      result = result + element.sizePrices * element.count;
    });
    totalAmount = result;
  }

  void calculateTotalWeight(List<CartModel> list) {
    double result = 0;
    list.forEach((element) {
      result = result + element.weight * element.count;
    });
    totalWeigth = result;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartEmptyState) {
          context.read<CartCubit>().getItemsCart();
        } else if (state is HaveCartState) {
          calculateTotalWeight(state.cartModel!);
          calculateTotalAmount(state.cartModel!);
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
                            context.read<CartCubit>().deleteCart();
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
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: state.countCart,
                    (context, index) => Column(
                      children: [
                        FoodCard(
                          cartModel: state.cartModel![index],
                          index: index,
                          onTap: () =>
                              context.read<CartCubit>().deteteItemInCart(index),
                          onUpdatePrice: () =>
                              calculateTotalAmount(state.cartModel!),
                          onUpdateWeight: () =>
                              calculateTotalWeight(state.cartModel!),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 12.h, bottom: 5.w, left: 16.w, right: 16.w),
                          child: Row(
                            children: [
                              CustomText(
                                title: 'Количество порций',
                                fontSize: 17,
                                color: ColorStyles.blackColor,
                                fontWeight: FontWeight.w500,
                              ),
                              const Spacer(),
                              SizedBox(
                                height: 40.h,
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (state.cartModel![index].count <
                                              2) {
                                            state.cartModel![index].count = 1;
                                          } else {
                                            state.cartModel![index].count--;
                                          }
                                          calculateTotalAmount(
                                              state.cartModel!);
                                          calculateTotalWeight(
                                              state.cartModel!);
                                          context
                                              .read<CartCubit>()
                                              .saveToCart(state.cartModel!);
                                          context
                                              .read<CartCubit>()
                                              .getItemsCart();
                                        });
                                      },
                                      child: Container(
                                        height: 32.h,
                                        width: 32.w,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SvgPicture.asset(
                                            SvgImg.minus,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      width: 30.w,
                                      child: CustomText(
                                        title: state.cartModel![index].count
                                            .toString(),
                                        fontSize: 17,
                                        color: ColorStyles.blackColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        state.cartModel![index].count++;
                                        calculateTotalAmount(state.cartModel!);
                                        calculateTotalWeight(state.cartModel!);
                                        context
                                            .read<CartCubit>()
                                            .saveToCart(state.cartModel!);
                                        setState(() {});
                                      },
                                      child: Container(
                                        height: 32.h,
                                        width: 32.w,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SvgPicture.asset(
                                            SvgImg.plus,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16.w, vertical: 2),
                        child: CustomText(
                          title: 'Итого:',
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16.w, vertical: 2),
                        child: CustomText(
                          title:
                              '${totalAmount.toString()} ₽ · ${totalWeigth.toStringAsFixed(2)} Ккал',
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 16.h),
                        child: CustomButton(
                          title: 'Оформить заказ',
                          onTap: () => Functions(context)
                              .showCheckoutBottomsheet(
                                  state.cartModel!, totalAmount, totalWeigth),
                        ),
                      )
                    ],
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
                      Functions(context).showMenuBottomsheet();
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
      toolbarHeight: Platform.isAndroid ? 90.h : 66.h,
      elevation: 1,
      expandedHeight: 10.h,
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
