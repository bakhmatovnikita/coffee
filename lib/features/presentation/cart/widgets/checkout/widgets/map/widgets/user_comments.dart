import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class UserCommentsWidget extends StatefulWidget {
  final bool privateHouse;
  final String title;
  final TextEditingController controller;
  const UserCommentsWidget(
      {super.key,
      required this.title,
      required this.controller,
      required this.privateHouse});

  @override
  State<UserCommentsWidget> createState() => _UserCommentsWidgetState();
}

class _UserCommentsWidgetState extends State<UserCommentsWidget> {
  @override
  void initState() {
    widget.controller.addListener(() {});
    super.initState();
  }

  bool onTap = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.h,
      margin: EdgeInsets.only(
          right: 16.w, left: 16.w, top: widget.privateHouse ? 0.h : 20.h),
      decoration: BoxDecoration(
        color: ColorStyles.whiteColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Center(
        child: TextField(
          controller: widget.controller,
          textAlign: onTap ? TextAlign.start : TextAlign.center,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w500,
            fontSize: 17.h,
            color: ColorStyles.blackColor,
          ),
          onChanged: (value) {
            if (widget.controller.text.isEmpty) {
              setState(() {
                onTap = false;
              });
            }
          },
          onTap: () {
            setState(() {
              onTap = true;
            });
          },
          cursorColor: ColorStyles.accentColor,
          keyboardType: TextInputType.text,
          decoration: InputDecoration.collapsed(
            hintText: onTap ? '' : widget.title,
            hintStyle: GoogleFonts.montserrat(
              fontWeight: FontWeight.w500,
              fontSize: 10.h,
              color: ColorStyles.greyTitleColor,
            ),
          ),
        ),
      ),
    );
  }
}
