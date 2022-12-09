import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/core/helpers/input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextCartField extends StatefulWidget {
  final Color color;
  final TextEditingController? controller;
  final TextInputType? type;
  const CustomTextCartField(
      {super.key, required this.color, this.controller, this.type});

  @override
  State<CustomTextCartField> createState() => _CustomTextCartFieldState();
}

class _CustomTextCartFieldState extends State<CustomTextCartField> {
  @override
  void initState() {
    widget.controller!.addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      margin: EdgeInsets.symmetric(horizontal: 16.w),
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
        inputFormatters: [CustomCartInputFormatter()],
        keyboardType: widget.type,
        decoration: InputDecoration.collapsed(
          hintText: '0000-0000-0000-0000',
          hintStyle: GoogleFonts.montserrat(
            fontWeight: FontWeight.w500,
            fontSize: 17.h,
          ),
        ),
      ),
    );
  }
}
