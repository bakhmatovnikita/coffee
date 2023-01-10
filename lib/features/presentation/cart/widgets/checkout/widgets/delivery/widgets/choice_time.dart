import 'dart:async';

import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/core/helpers/functions.dart';
import 'package:cofee/custom_widgets/custom_button.dart';
import 'package:cofee/custom_widgets/custom_text.dart';
import 'package:cofee/features/presentation/cart/widgets/checkout/widgets/delivery/widgets/time_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChoiceTime extends StatefulWidget {
  final PageController pageController;
  const ChoiceTime({super.key, required this.pageController});

  @override
  State<ChoiceTime> createState() => _ChoiceTimeState();
}

class _ChoiceTimeState extends State<ChoiceTime> {
  final streamController = StreamController<int>();

  List<Map<String, dynamic>> listTimesSelected = [
    {
      'title': '8:00-8:30',
      'isSelected': false,
    },
    {
      'title': '8:00-8:30',
      'isSelected': false,
    },
    {
      'title': '8:00-8:30',
      'isSelected': false,
    },
    {
      'title': '8:00-8:30',
      'isSelected': false,
    },
    {
      'title': '8:00-8:30',
      'isSelected': false,
    },
    {
      'title': '8:00-8:30',
      'isSelected': false,
    },
    {
      'title': '8:00-8:30',
      'isSelected': false,
    },
    {
      'title': '8:00-8:30',
      'isSelected': false,
    },
    {
      'title': '8:00-8:30',
      'isSelected': false,
    }
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StreamBuilder<int>(
        stream: streamController.stream,
        initialData: 0,
        builder: (context, snapshot) {
          return Expanded(
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: CustomText(
                        title: 'Шаг 1',
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w500,
                        color: ColorStyles.greyTitleColor,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: CustomText(
                        title: 'Выберите время получения заказа',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: ColorStyles.blackColor,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 35.w,
                        top: 61.h,
                        bottom: 18.h,
                      ),
                      child: CustomText(
                        title: 'Доступное время',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: ColorStyles.blackColor,
                      ),
                    ),
                    Container(
                      height: 44.h,
                      width: size.width.w,
                      margin: EdgeInsets.symmetric(horizontal: 16.w),
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: listTimesSelected.length,
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 8,
                          );
                        },
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            streamController.sink.add(index);
                          },
                          child: timeIsSelected(
                            isSelected: snapshot.data! == index
                                ? listTimesSelected[index]['isSelected'] = true
                                : listTimesSelected[index]['isSelected'] =
                                    false,
                            title: listTimesSelected[index]['title'],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 112.h,
                      width: size.width,
                      padding: EdgeInsets.symmetric(
                          horizontal: 65.w, vertical: 12.h),
                      margin: EdgeInsets.only(
                        top: 97.h,
                        left: 16.w,
                        right: 16.w,
                        bottom: 24.h,
                      ),
                      decoration: BoxDecoration(
                          color: ColorStyles.whiteColor,
                          borderRadius: BorderRadius.circular(16.r)),
                      child: Column(
                        children: [
                          CustomText(
                            title: 'Заказ будет доставлен в интервале времени:',
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w500,
                            centerTitle: true,
                            color: ColorStyles.greyTitleColor,
                          ),
                          CustomText(
                            title: '09:00 - 10:00',
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w500,
                            centerTitle: true,
                            color: ColorStyles.greyTitleColor,
                          ),
                        ],
                      ),
                    ),
                    CustomButton(
                      title: 'Далее',
                      onTap: () => widget.pageController.nextPage(
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeInOutQuint,
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        });
  }
}
