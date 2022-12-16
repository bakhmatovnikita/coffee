import 'dart:async';
import 'dart:math';

import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/custom_widgets/custom_button.dart';
import 'package:cofee/custom_widgets/custom_text.dart';
import 'package:cofee/features/presentation/cart/widgets/checkout/widgets/time_accept/widgets/time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeAccept extends StatefulWidget {
  final PageController pageController;
  const TimeAccept({super.key, required this.pageController});

  @override
  State<TimeAccept> createState() => _TimeAcceptState();
}

class _TimeAcceptState extends State<TimeAccept> {
  List<Map<String, dynamic>> listTimes = [
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

  final streamController = StreamController<int>();
  final streamControllerListView = StreamController<int>();
  @override
  Widget build(BuildContext context) {
    const degrees = 45;
    const angle = degrees * pi / 180;
    Size size = MediaQuery.of(context).size;
    return StreamBuilder<int>(
        stream: streamController.stream,
        initialData: 0,
        builder: (context, snapshot) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 16.w, left: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      title: 'Шаг 1',
                      color: ColorStyles.greyTitleColor,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 4.h),
                      child: CustomText(
                        title: 'Выберите время получения заказа',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(top: 48.h, left: 35.w, bottom: 16.h),
                      child: CustomText(
                        title: "Доступное время",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...List.generate(
                          listTimes.length,
                          (index) => GestureDetector(
                            onTap: () {
                              streamController.sink.add(index);
                            },
                            child: time(
                              title: listTimes[index]['title'],
                              isSelected: snapshot.data! == index
                                  ? listTimes[index]['isSelected'] = true
                                  : listTimes[index]['isSelected'] = false,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.h),
                child: SizedBox(
                  height: 83.h,
                  width: size.width,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 70),
                        child: AnimatedAlign(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeInOutQuint,
                          alignment: snapshot.data! == 0
                              ? Alignment.topLeft
                              : snapshot.data! == 1
                                  ? Alignment.topCenter
                                  : Alignment.topRight,
                          child: Transform.rotate(
                            angle: angle,
                            child: Container(
                              height: 15.h,
                              width: 15.h,
                              color: const Color(0xffE1E1E1),
                            ),
                          ),
                        ),
                      ),
                      StreamBuilder<int>(
                        stream: streamControllerListView.stream,
                        initialData: 0,
                        builder: (context, snapshot) {
                          return Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 76.h,
                              color: const Color(0xffE1E1E1),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 16.h,
                                ),
                                child: ListView.separated(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.w),
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () => streamControllerListView.sink
                                          .add(index),
                                      child: timeIsSelected(
                                        title: listTimesSelected[index]
                                            ['title'],
                                        isSelected: snapshot.data! == index
                                            ? listTimesSelected[index]
                                                ['isSelected'] = true
                                            : listTimesSelected[index]
                                                ['isSelected'] = false,
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(
                                      width: 8,
                                    );
                                  },
                                  itemCount: listTimesSelected.length,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 112.h,
                width: size.width,
                margin: EdgeInsets.only(
                    top: 16.h, left: 16.w, right: 16.w, bottom: 24.h),
                decoration: BoxDecoration(
                  color: ColorStyles.whiteColor,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      title: 'Заказ будет готов в:',
                      fontSize: 17.sp,
                      color: ColorStyles.greyTitleColor,
                      fontWeight: FontWeight.w500,
                    ),
                     CustomText(
                      title: '8:15',
                      fontSize: 32.sp,
                      color: ColorStyles.accentColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
              CustomButton(
                title: "Далее",
                onTap: () {
                  setState(
                    () {
                      widget.pageController.nextPage(
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeInOutQuint,
                      );
                    },
                  );
                },
              ),
            ],
          );
        });
  }
}
