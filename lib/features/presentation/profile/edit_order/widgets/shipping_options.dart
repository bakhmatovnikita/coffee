import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShippingOptions extends StatefulWidget {
  final String title;
  final bool isSelected;
  const ShippingOptions(
      {super.key, required this.title, required this.isSelected});

  @override
  State<ShippingOptions> createState() => _ShippingOptionsState();
}

class _ShippingOptionsState extends State<ShippingOptions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      height: 56.h,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: ColorStyles.whiteColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 23.h,
            width: 23.w,
            margin: EdgeInsets.only(left: 21.w, right: 9.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: widget.isSelected
                    ? ColorStyles.accentColor
                    : ColorStyles.blackColor,
                width: 2.w,
              ),
            ),
            child: widget.isSelected
                ? Container(
                    margin: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: widget.isSelected ? ColorStyles.accentColor : null,
                    ),
                  )
                : Container(),
          ),
          CustomText(
            title: widget.title,
            color: widget.isSelected
                ? ColorStyles.accentColor
                : ColorStyles.blackColor,
            fontSize: 17.sp,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
