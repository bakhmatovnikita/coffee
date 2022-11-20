import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PushError extends StatelessWidget {
  const PushError({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.h,
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        color: const Color(0xffD30000),
        borderRadius: BorderRadius.circular(8),
      ),

    );
  }
}
