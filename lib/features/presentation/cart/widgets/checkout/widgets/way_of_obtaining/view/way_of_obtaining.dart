import 'dart:async';
import 'dart:ffi';

import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/custom_widgets/custom_button.dart';
import 'package:cofee/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/shipping_options.dart';

class WayOfObtaining extends StatefulWidget {
  final PageController pageController;
  const WayOfObtaining({Key? key, required this.pageController})
      : super(key: key);

  @override
  State<WayOfObtaining> createState() => _WayOfObtainingState();
}

class _WayOfObtainingState extends State<WayOfObtaining> {
  List<Map<String, dynamic>> wayOfObtaining = [
    {
      'isSelected': true,
      'title': "На подносе",
    },
    {
      'isSelected': true,
      'title': "В контейнере",
    },
    {
      'isSelected': true,
      'title': "Доставка",
    },
  ];
  final streamController = StreamController<int>();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      initialData: 0,
      stream: streamController.stream,
      builder: (context, snapshot) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 16.w, left: 16.w, bottom: 56.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    title: 'Шаг 1',
                    color: ColorStyles.greyTitleColor,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  CustomText(
                    title: 'Выберите способ получения заказа',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 200.h,
              child: ListView.builder(
                padding: const EdgeInsets.all(0),
                itemCount: wayOfObtaining.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => streamController.sink.add(index),
                  child: ShippingOptions(
                    title: wayOfObtaining[index]['title'],
                    isSelected: snapshot.data! == index
                        ? wayOfObtaining[index]['isSelected'] = true
                        : wayOfObtaining[index]['isSelected'] = false,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 23),
              child: CustomButton(
                  title: 'Далее',
                  onTap: () {
                    setState(() {
                      widget.pageController.nextPage(
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeInOutQuint,
                      );
                    });
                  }),
            )
          ],
        );
      },
    );
  }
}
