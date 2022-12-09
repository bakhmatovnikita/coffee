import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/core/helpers/input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextCartFieldDate extends StatefulWidget {
  final Color color;
  final TextEditingController? controller;
  final TextInputType? type;
  const CustomTextCartFieldDate(
      {super.key, required this.color, this.controller, this.type});

  @override
  State<CustomTextCartFieldDate> createState() =>
      _CustomTextCartFieldDateState();
}

class _CustomTextCartFieldDateState extends State<CustomTextCartFieldDate> {
  @override
  void initState() {
    widget.controller!.addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 164.w,
      height: 48.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: widget.color,
      ),
      child: TextField(
        controller: widget.controller,
        style: GoogleFonts.montserrat(
          fontWeight: FontWeight.w500,
          fontSize: 17.h,
          color: ColorStyles.blackColor,
        ),
        cursorColor: ColorStyles.accentColor,
        inputFormatters: [CustomCartInputDateFormatter()],
        keyboardType: widget.type,
        decoration: InputDecoration.collapsed(
          hintText: '00/00',
          hintStyle: GoogleFonts.montserrat(
            fontWeight: FontWeight.w500,
            fontSize: 17.h,
          ),
        ),
      ),
    );
  }
}
