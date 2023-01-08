import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/core/helpers/functions.dart';
import 'package:cofee/core/helpers/images.dart';
import 'package:cofee/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scale_button/scale_button.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 25.w,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: SvgPicture.asset(
                      SvgImg.goBackk,
                      height: 17.82.h,
                      width: 10.26.w,
                      color: ColorStyles.accentColor,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.center,
                child: CustomText(
                  title: 'Подробнее о заказе',
                  color: ColorStyles.blackColor,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Padding(
                  padding: EdgeInsets.only(
                    right: 25.w,
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: SvgPicture.asset(
                      SvgImg.cross,
                      height: 13.64.h,
                      width: 13.64.w,
                      color: ColorStyles.accentColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: CustomText(
                  title: 'Заказ № №32809432',
                  color: ColorStyles.greyTitleColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 38.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CustomText(
                          title: 'Статус',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: ColorStyles.blackColor,
                        ),
                        const Spacer(),
                        CustomText(
                          title: 'Получено',
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w700,
                          color: ColorStyles.blackColor,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Row(
                      children: [
                        CustomText(
                          title: 'Дата и время',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: ColorStyles.blackColor,
                        ),
                        const Spacer(),
                        CustomText(
                          title: '01.02.2022 11:00',
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w700,
                          color: ColorStyles.blackColor,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Row(
                      children: [
                        CustomText(
                          title: 'Оплата',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: ColorStyles.blackColor,
                        ),
                        const Spacer(),
                        CustomText(
                          title: 'Банковской картой',
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w700,
                          color: ColorStyles.blackColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 1.h,
                width: size.width,
                color: Colors.grey[300],
                margin: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 20.h,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CustomText(
                          title: 'Сумма заказа',
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w700,
                          color: ColorStyles.blackColor,
                        ),
                        const Spacer(),
                        CustomText(
                          title: '534 ₽',
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w700,
                          color: ColorStyles.blackColor,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Row(
                      children: [
                        CustomText(
                          title: 'Окрошка ( 1х )',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: ColorStyles.blackColor,
                        ),
                        const Spacer(),
                        CustomText(
                          title: '230 ₽',
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w400,
                          color: ColorStyles.blackColor,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Row(
                      children: [
                        CustomText(
                          title: 'Сырники ( 2х )',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: ColorStyles.blackColor,
                        ),
                        const Spacer(),
                        CustomText(
                          title: '304 ₽',
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w400,
                          color: ColorStyles.blackColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 126.h,
                width: size.width,
                margin: EdgeInsets.only(
                  top: 20.h,
                  right: 16.w,
                  left: 16.w,
                  bottom: 16.h,
                ),
                padding: EdgeInsets.only(
                  top: 24.h,
                  bottom: 33.5.h,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(
                      title: 'Ваша оценка',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: ColorStyles.blackColor,
                    ),
                    const Spacer(),
                    RatingBar.builder(
                      itemSize: 33,
                      initialRating: 0,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 7.0),
                      itemBuilder: (context, index) => SvgPicture.asset(
                        SvgImg.star,
                        color: ColorStyles.accentColor,
                        height: 33.h,
                        width: 33.w,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ],
                ),
              ),
              ScaleButton(
                onTap: () => Functions(context).showComplaintPageBottomSheet(),
                bound: 0.02,
                duration: const Duration(milliseconds: 100),
                child: Container(
                  height: 48.h,
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: CustomText(
                    title: "Пожаловаться",
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: ColorStyles.blackColor,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
