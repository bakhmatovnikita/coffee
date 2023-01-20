import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../constants/colors/color_styles.dart';
import '../../../../../../core/helpers/images.dart';
import '../../../../../../custom_widgets/custom_button.dart';
import '../../../../../../custom_widgets/custom_text.dart';

class TimeAcceptBottomsheet extends StatefulWidget {
  const TimeAcceptBottomsheet({super.key});

  @override
  State<TimeAcceptBottomsheet> createState() => _TimeAcceptBottomsheetState();
}

class _TimeAcceptBottomsheetState extends State<TimeAcceptBottomsheet> {
  int hour1 = DateTime.now().hour;
  int minutes1 = DateTime.now().minute;
  int hour2 = 0;
  int minutes2 = 0;

  List<Map<String, dynamic>> listTimes = [
    {
      'title': '',
      'isSelected': false,
    },
    {
      'title': '',
      'isSelected': false,
    },
    {
      'title': '',
      'isSelected': false,
    },
  ];
  List<Map<String, dynamic>> listTimesSelected = [
    {
      'title': [
        {
          'title': '',
          'isSelected': false,
        },
        {
          'title': '',
          'isSelected': false,
        },
        {
          'title': '',
          'isSelected': false,
        },
      ],
    },
    {
      'title': [
        {
          'title': '',
          'isSelected': false,
        },
        {
          'title': '',
          'isSelected': false,
        },
        {
          'title': '',
          'isSelected': false,
        },
      ],
    },
    {
      'title': [
        {
          'title': '',
          'isSelected': false,
        },
        {
          'title': '',
          'isSelected': false,
        },
        {
          'title': '',
          'isSelected': false,
        },
      ],
    },
  ];

  final streamController = StreamController<int>();
  final streamControllerListView = StreamController<int>();

  void availableTime() {
    for (int i = 0; i < listTimesSelected.length; i++) {
      listTimes[i]['title'] = minutes1 < 10
          ? '$hour1:0$minutes1 - $hour2:$minutes2'
          : minutes2 < 10
              ? '$hour1:$minutes1 - $hour2:0$minutes2'
              : minutes1 < 10 && minutes2 < 10
                  ? '$hour1:0$minutes1 - $hour2:0$minutes2'
                  : '$hour1:$minutes1 - $hour2:$minutes2';
      if (i == 0) {
        hour2 = hour1;
        minutes2 = minutes1 + 30;
        if (minutes2 > 59) {
          hour2++;
          minutes2 -= 60;
        }
      } else {
        hour1 = hour2;
        minutes1 = minutes2;
        hour2 = hour1;
        minutes2 = minutes1 + 30;
        if (minutes2 > 59) {
          hour2++;
          minutes2 -= 60;
        }
      }
      timeSelcted(hour1, minutes1, hour2, minutes2, i);
      listTimes[i]['title'] = minutes1 < 10
          ? '$hour1:0$minutes1 - $hour2:$minutes2'
          : minutes2 < 10
              ? '$hour1:$minutes1 - $hour2:0$minutes2'
              : minutes1 < 10 && minutes2 < 10
                  ? '$hour1:0$minutes1 - $hour2:0$minutes2'
                  : '$hour1:$minutes1 - $hour2:$minutes2';
    }
  }

  void timeSelcted(int hour1, int minutes1, int hour2, int minutes2, int i) {
    for (var index = 0; index < listTimesSelected[i]['title'].length; index++) {
      if (index == 0) {
        hour2 = hour1;
        minutes2 = minutes1 + 10;
        if (minutes2 > 59) {
          hour2++;
          minutes2 -= 60;
        }
      } else {
        hour1 = hour2;
        minutes1 = minutes2;
        hour2 = hour1;
        minutes2 = minutes1 + 10;
        if (minutes2 > 59) {
          hour2++;
          minutes2 -= 60;
        }
      }
      listTimesSelected[i]['title'][index]['title'] = minutes1 < 10
          ? '$hour1:0$minutes1 - $hour2:$minutes2'
          : minutes2 < 10
              ? '$hour1:$minutes1 - $hour2:0$minutes2'
              : minutes1 < 10 && minutes2 < 10
                  ? '$hour1:0$minutes1 - $hour2:0$minutes2'
                  : '$hour1:$minutes1 - $hour2:$minutes2';
    }
  }

  @override
  void initState() {
    availableTime();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const degrees = 45;
    const angle = degrees * pi / 180;
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SizedBox(
              height: 20.h,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: SvgPicture.asset(
                        SvgImg.goBackk,
                        height: 17.82.h,
                        width: 10.26.w,
                        color: ColorStyles.accentColor,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: CustomText(
                      title: 'Изменить временя',
                      color: ColorStyles.blackColor,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        StreamBuilder<int>(
          stream: streamController.stream,
          initialData: 0,
          builder: (context, snapshotListTime) {
            return StreamBuilder<int>(
              stream: streamControllerListView.stream,
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
                          Container(
                            margin: EdgeInsets.only(
                                top: 48.h, left: 35.w, bottom: 16.h),
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
                                    setState(() {
                                      // timeSelcted();
                                    });
                                    streamController.sink.add(index);
                                  },
                                  child: time(
                                    title: listTimes[index]['title'],
                                    isSelected: snapshotListTime.data! == index
                                        ? listTimes[index]['isSelected'] = true
                                        : listTimes[index]['isSelected'] =
                                            false,
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
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 76.h,
                                color: const Color(0xffE1E1E1),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 16.h,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      ...List.generate(
                                        3,
                                        (index) => GestureDetector(
                                          onTap: () {
                                            streamControllerListView.sink
                                                .add(index);
                                          },
                                          child: timeIsSelected(
                                            title: listTimesSelected[
                                                    snapshotListTime.data!]
                                                ['title'][index]['title'],
                                            isSelected: snapshot.data! == index
                                                ? listTimesSelected[index]
                                                        ['title'][index]
                                                    ['isSelected'] = true
                                                : listTimesSelected[index]
                                                        ['title'][index]
                                                    ['isSelected'] = false,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // child: ListView.builder(
                                  //   physics: const BouncingScrollPhysics(),
                                  //   scrollDirection: Axis.horizontal,
                                  //   padding:
                                  //       EdgeInsets.symmetric(horizontal: 16.w),
                                  //   itemBuilder: (context, index) {
                                  // return GestureDetector(
                                  //   onTap: () {
                                  //     streamControllerListView.sink
                                  //         .add(index);
                                  //   },
                                  //   child: timeIsSelected(
                                  //     title: listTimesSelected[
                                  //             snapshotListTime.data!]['title']
                                  //         [index]['title'],
                                  //     isSelected: snapshot.data! == index
                                  //         ? listTimesSelected[index]['title']
                                  //             [index]['isSelected'] = true
                                  //         : listTimesSelected[index]['title']
                                  //             [index]['isSelected'] = false,
                                  //   ),
                                  // );
                                  //   },
                                  //   itemCount: listTimesSelected.length,
                                  // ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 70),
                              child: AnimatedAlign(
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeInOutQuint,
                                alignment: snapshotListTime.data! == 0
                                    ? Alignment.topLeft
                                    : snapshotListTime.data! == 1
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
                            title: listTimesSelected[snapshotListTime.data!]
                                ['title'][snapshot.data!]['title'],
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
                        // setState(
                        //   () {
                        //     pageController.nextPage(
                        //       duration: const Duration(milliseconds: 600),
                        //       curve: Curves.easeInOutQuint,
                        //     );
                        //   },
                        // );
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
      ],
    );
  }
}

Widget time({required String title, required bool isSelected}) {
  return Container(
    height: 44.h,
    decoration: BoxDecoration(
        color: ColorStyles.whiteColor,
        borderRadius: BorderRadius.circular(8.r)),
    alignment: Alignment.center,
    child: CustomText(
      title: title,
      fontSize: 17.sp,
      fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
      color: isSelected ? ColorStyles.blackColor : ColorStyles.greyTitleColor,
    ),
  );
}

Widget timeIsSelected({required String title, required bool isSelected}) {
  return Container(
    height: 44.h,
    decoration: BoxDecoration(
      color: ColorStyles.whiteColor,
      borderRadius: BorderRadius.circular(8.r),
      border: Border.all(
        color: isSelected ? ColorStyles.accentColor : Colors.transparent,
        width: 2,
      ),
    ),
    margin: EdgeInsets.symmetric(horizontal: 5.w),
    alignment: Alignment.center,
    child: CustomText(
      title: title,
      fontSize: 17.sp,
      fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
      color: isSelected ? ColorStyles.blackColor : ColorStyles.greyTitleColor,
    ),
  );
}
