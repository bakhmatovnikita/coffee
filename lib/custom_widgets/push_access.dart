import 'package:cofee/core/helpers/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PushAccess extends StatelessWidget {
  final String title;
  final String subTitle;
  const PushAccess({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.h,
      margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 90.h),
      decoration: BoxDecoration(
        color: const Color(0xff039D00),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 13.2.h, left: 13.6.w),
              child: SvgPicture.asset(
                SvgImg.pencilCircle,
                height: 20.h,
                width: 20.w,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.h, bottom: 8.h, left: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.montserrat(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xffFFFFFF)),
                ),
                Text(
                  subTitle,
                  style: GoogleFonts.montserrat(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xffFFFFFF)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
