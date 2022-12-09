import 'dart:async';

import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/core/helpers/functions.dart';
import 'package:cofee/core/helpers/images.dart';
import 'package:cofee/custom_widgets/custom_button.dart';
import 'package:cofee/custom_widgets/custom_text.dart';
import 'package:cofee/features/presentation/cart/widgets/checkout/widgets/selected_cart/widgets/cart_selected.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectCart extends StatefulWidget {
  final PageController pageController;
  final double totalAmount;
  const SelectCart({super.key, required this.totalAmount, required this.pageController});

  @override
  State<SelectCart> createState() => _SelectCartState();
}

class _SelectCartState extends State<SelectCart> {
  final streamController = StreamController<int>();
  List<Map<String, dynamic>> listCart = [
    {
      'title': "Visa Gold (#9523)",
      'isSelected': true,
    },
    {
      'title': "Visa Silver (#9523)",
      'isSelected': true,
    },
    {
      'title': "Visa Bonze (#9523)",
      'isSelected': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: streamController.stream,
      initialData: 0,
      builder: (context, snapshot) {
        return Expanded(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(left: 16.w, right: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        title: 'Шаг 4',
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w500,
                        color: ColorStyles.greyTitleColor,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 4.h),
                        child: CustomText(
                          title: 'Оплата заказа',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: ColorStyles.blackColor,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 8.h,
                        ),
                        child: CustomText(
                          title: 'Выберите способ оплаты',
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w500,
                          color: ColorStyles.blackColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(top: 16.h, bottom: 16.h),
                  child: Column(
                    children: [
                      ...List.generate(
                        listCart.length,
                        (index) => GestureDetector(
                          onTap: () => streamController.sink.add(index),
                          child: SelectedCart(
                            title: listCart[index]['title'],
                            isSelected: snapshot.data! == index
                                ? listCart[index]['isSelected'] = true
                                : listCart[index]['isSelected'] = false,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Functions(context).showCartAddedBottomsheet(),
                        child: Container(
                          width: 343.w,
                          height: 56.h,
                          margin: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: ColorStyles.whiteColor,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 16.83.h,
                                width: 16.83.h,
                                margin: EdgeInsets.only(
                                    left: 23.58.w, right: 11.58.w),
                                child: SvgPicture.asset(
                                  SvgImg.plus,
                                  color: ColorStyles.blackColor,
                                ),
                              ),
                              CustomText(
                                title: 'Добавить карту',
                                color: ColorStyles.blackColor,
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 1,
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  color: const Color(0xffCDCDCD),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 84.h,
                  width: 343.w,
                  margin:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
                  decoration: BoxDecoration(
                      color: ColorStyles.whiteColor,
                      borderRadius: BorderRadius.circular(16.r)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        title: 'БАЛАНС БОНУСНОГО СЧЕТА',
                        color: ColorStyles.greyTitleColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                      const Spacer(),
                      CustomText(
                        title: '500 ₽',
                        color: ColorStyles.accentColor,
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: CustomText(
                    title:
                        'Внимание!  В первую очередь списание происходит с внутреннего счета, а остаток суммы оплачивается с помощью банковской карты ',
                    color: ColorStyles.greyTitleColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        title: 'Итого к оплате:',
                        color: ColorStyles.blackColor,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      CustomText(
                        title: '${widget.totalAmount} ₽ (-10%)',
                        color: ColorStyles.blackColor,
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 96.h),
                  child: CustomButton(
                    title: 'Оплатить',
                    onTap: () => setState(
                  () {
                    widget.pageController.nextPage(
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeInOutQuint,
                    );
                  },
                ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
