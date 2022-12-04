import 'dart:async';

import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DayOfWeek {
  String day;
  bool selected;
  bool today;

  DayOfWeek({
    required this.day,
    required this.selected,
    required this.today,
  });
}

void calendarSelectModal(
  BuildContext context,
  Offset offset,
  Function(int index) onTap,
  int iconIndex,
) =>
    showDialog(
      useSafeArea: false,
      barrierColor: Colors.transparent,
      context: context,
      builder: (context) {
        // bool isInit = false;
        // bool isInitOpacity = false;
        // ScrollController scrollController = ScrollController(
        //     initialScrollOffset: iconIndex == 0 ? 0 : (57.h * (iconIndex - 1)));
        return AlertDialog(
          insetPadding: EdgeInsets.only(top: offset.dy, left: offset.dx),
          alignment: Alignment.topLeft,
          contentPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconColor: Colors.transparent,
          content: CalendarView(),
        );
      },
    );

class CalendarView extends StatelessWidget {
  CalendarView({super.key});

  final _streamController = StreamController<DayOfWeek>();
  final _eatController = StreamController<int>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 30.w,
      height: 112.h,
      decoration: BoxDecoration(
        color: ColorStyles.backgroundColor,
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          )
        ],
        borderRadius: BorderRadius.circular(29.r),
      ),
      child: Stack(
        children: [
          StreamBuilder<DayOfWeek>(
              stream: _streamController.stream,
              initialData:
                  _daysOfWeek.firstWhere((element) => element.selected),
              builder: (context, snapshot) {
                return Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 8.h),
                    child: Row(
                      children: _daysOfWeek
                          .map((e) => _dayWidget(e, e == snapshot.data))
                          .toList(),
                    ),
                  ),
                );
              }),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 0.2,
              color: Colors.grey,
              margin: EdgeInsets.symmetric(horizontal: 15.w),
            ),
          ),
          StreamBuilder<int>(
              stream: _eatController.stream,
              initialData: 0,
              builder: (context, snapshot) {
                return Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => _eatController.sink.add(0),
                          child: Container(
                            height: 40.h,
                            width: 93.w,
                            decoration: BoxDecoration(
                              color: ColorStyles.whiteColor,
                              borderRadius: BorderRadius.circular(45.r),
                            ),
                            alignment: Alignment.center,
                            child: CustomText(
                              title: 'Завтрак',
                              fontSize: 17.h,
                              color: snapshot.data == 1
                                  ? ColorStyles.blackColor
                                  : ColorStyles.accentColor,
                              fontWeight: snapshot.data == 1
                                  ? FontWeight.w600
                                  : FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        GestureDetector(
                          onTap: () => _eatController.sink.add(1),
                          child: Container(
                            height: 40.h,
                            width: 68.w,
                            decoration: BoxDecoration(
                              color: ColorStyles.whiteColor,
                              borderRadius: BorderRadius.circular(45.r),
                            ),
                            alignment: Alignment.center,
                            child: CustomText(
                              title: 'Обед',
                              fontSize: 17.h,
                              color: snapshot.data == 0
                                  ? ColorStyles.blackColor
                                  : ColorStyles.accentColor,
                              fontWeight: snapshot.data == 0
                                  ? FontWeight.w600
                                  : FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }

  // ignore: prefer_final_fields
  List<DayOfWeek> _daysOfWeek = [
    DayOfWeek(
      day: 'ПН',
      selected: DateTime.now().weekday == 1 ? true : false,
      today: DateTime.now().weekday == 1 ? true : false,
    ),
    DayOfWeek(
      day: 'ВТ',
      selected: DateTime.now().weekday == 2 ? true : false,
      today: DateTime.now().weekday == 2 ? true : false,
    ),
    DayOfWeek(
      day: 'СР',
      selected: DateTime.now().weekday == 3 ? true : false,
      today: DateTime.now().weekday == 3 ? true : false,
    ),
    DayOfWeek(
      day: 'ЧТ',
      selected: DateTime.now().weekday == 4 ? true : false,
      today: DateTime.now().weekday == 4 ? true : false,
    ),
    DayOfWeek(
      day: 'ПТ',
      selected: DateTime.now().weekday == 5 ? true : false,
      today: DateTime.now().weekday == 5 ? true : false,
    ),
    DayOfWeek(
      day: 'СБ',
      selected: DateTime.now().weekday == 6 ? true : false,
      today: DateTime.now().weekday == 6 ? true : false,
    ),
    DayOfWeek(
      day: 'ВС',
      selected: DateTime.now().weekday == 7 ? true : false,
      today: DateTime.now().weekday == 7 ? true : false,
    ),
  ];

  Widget _dayWidget(DayOfWeek dayOfWeek, bool selected) {
    return GestureDetector(
      onTap: () {
        _daysOfWeek.forEach((element) {
          element.selected = false;
        });
        _daysOfWeek.firstWhere((element) => element == dayOfWeek).selected =
            true;
        _streamController.sink.add(dayOfWeek);
      },
      child: Container(
        width: 40.h,
        height: 40.h,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 4.w),
        decoration: BoxDecoration(
          color: selected ? ColorStyles.accentColor : ColorStyles.whiteColor,
          shape: BoxShape.circle,
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: CustomText(
                title: dayOfWeek.day,
                fontSize: 14,
                color:
                    selected ? ColorStyles.whiteColor : ColorStyles.blackColor,
              ),
            ),
            if (dayOfWeek.today)
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 4.h,
                  height: 4.h,
                  margin: EdgeInsets.only(bottom: 4.h),
                  decoration: BoxDecoration(
                    color: selected
                        ? ColorStyles.whiteColor
                        : ColorStyles.accentColor,
                    shape: BoxShape.circle,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
