import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scale_button/scale_button.dart';

class CustomButton extends StatelessWidget {
  final String title;
  Function()? onTap;
  bool accent;
  CustomButton({
    super.key,
    required this.title,
    this.accent = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ScaleButton(
      onTap: onTap,
      bound: 0.02,
      duration: const Duration(milliseconds: 100),
      child: Container(
        height: 48.h,
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: accent ? ColorStyles.accentColor : Colors.white,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: CustomText(
          title: title,
          fontSize: 17,
          fontWeight: accent ? FontWeight.w500 : null,
          color: accent ? ColorStyles.whiteColor : ColorStyles.accentColor,
        ),
      ),
    );
  }
}
