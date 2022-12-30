import 'package:cofee/constants/colors/color_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/helpers/input_formatter.dart';

class CustomTextCartFieldCvv extends StatefulWidget {
  final Color color;
  final TextEditingController? controller;
  final TextInputType? type;
  const CustomTextCartFieldCvv(
      {super.key, required this.color, this.controller, this.type});

  @override
  State<CustomTextCartFieldCvv> createState() => _CustomTextCartFieldCvvState();
}

class _CustomTextCartFieldCvvState extends State<CustomTextCartFieldCvv> {
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
        inputFormatters: [CustomCartInputCvvFormatter()],
        keyboardType: widget.type,
        decoration: InputDecoration.collapsed(
          hintText: '000',
          hintStyle: GoogleFonts.montserrat(
            fontWeight: FontWeight.w500,
            fontSize: 17.h,
          ),
        ),
      ),
    );
  }
}
