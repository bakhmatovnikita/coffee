import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/core/helpers/input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final Color color;
  final TextEditingController? controller;
  final TextInputType? type;
  const CustomTextField({super.key, required this.color, this.controller, this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: color,
      ),
      child: TextField(
        controller: controller,
        onChanged: (value){
          print(value.length);
        },
        style: GoogleFonts.montserrat(
          fontWeight: FontWeight.w500,
          fontSize: 17.h,
          color: ColorStyles.blackColor,
        ),
        cursorColor: ColorStyles.accentColor,
        inputFormatters: [
          CustomInputFormatter(),
        ],
        keyboardType: type,
        decoration: InputDecoration.collapsed(
          hintText: '+7 (999) 999-99-99',
          hintStyle: GoogleFonts.montserrat(
            fontWeight: FontWeight.w500,
            fontSize: 17.h,
          ),
        ),
      ),
    );
  }
}
