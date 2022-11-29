import 'package:cofee/constants/colors/color_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ChoicedRestaurant extends StatefulWidget {
  final String title;
  final String adress;
  final bool isSelected;
  const ChoicedRestaurant({
    super.key,
    required this.title,
    required this.adress, required this.isSelected,
  });

  @override
  State<ChoicedRestaurant> createState() => _ChoicedRestaurantState();
}

class _ChoicedRestaurantState extends State<ChoicedRestaurant> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      margin: EdgeInsets.symmetric(vertical: 4.h),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color:
              widget.isSelected ? ColorStyles.accentColor : const Color(0xffCDCDCD),
          width: 2.w
        ),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 19.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 10.h,
                  width: 10.w,
                  margin: EdgeInsets.only(right: 7.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorStyles.accentColor,
                  ),
                ),
                Flexible(
                  child: Text(
                    widget.title,
                    style: GoogleFonts.montserrat(
                      color: ColorStyles.accentColor,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: Text(
                'Адрес:',
                style: GoogleFonts.montserrat(
                  color: ColorStyles.blackColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Text(
              widget.adress,
              style: GoogleFonts.montserrat(
                color: ColorStyles.blackColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
