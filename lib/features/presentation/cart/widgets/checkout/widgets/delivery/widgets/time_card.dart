import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget timeIsSelected({required String title, required bool isSelected}) {
  return Container(
    height: 44.h,
    width: 131.w,
    decoration: BoxDecoration(
        color: ColorStyles.whiteColor,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: isSelected ? ColorStyles.accentColor : Colors.transparent,
          width: 2,
        )),
    alignment: Alignment.center,
    child: CustomText(
      title: title,
      fontSize: 17.sp,
      fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
      color: isSelected ? ColorStyles.blackColor : ColorStyles.greyTitleColor,
    ),
  );
}