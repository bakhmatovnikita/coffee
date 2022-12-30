import 'package:cofee/constants/colors/color_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotHaveDay extends StatelessWidget {
  const NotHaveDay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 154.h,
        width: 270.w,
        decoration: BoxDecoration(
          color: const Color(0xffF2F2F2),
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Column(
                children: [
                  const Text(
                    'Меню недоступно',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4.h),
                    child: const Text(
                      'Меню на выбранный день\nнедоступно, заказ можно оформить\nв пятницу после 18:00',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 0.2,
              color: ColorStyles.greyTitleColor,
            ),
            TextButton(
              style: const ButtonStyle(
                  // shadowColor: MaterialStatePropertyAll(Colors.grey),
                  // overlayColor: MaterialStatePropertyAll(Colors.grey[300]),
                  ),
              onPressed: () {},
              child: Text(
                "Выбрать другой день",
                style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ));
  }
}
