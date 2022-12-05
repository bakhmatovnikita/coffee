import 'package:cofee/core/helpers/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PushError extends StatelessWidget {
  final String title;
  const PushError({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.h,
      margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: const Color(0xffD30000),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 13.2.h, left: 13.6.w),
              child: SvgPicture.asset(
                SvgImg.error,
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
                  'Ошибка',
                  style: GoogleFonts.montserrat(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xffFFFFFF)
                  ),
                ),
                Text(
                  title,
                  style: GoogleFonts.montserrat(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xffFFFFFF)
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
