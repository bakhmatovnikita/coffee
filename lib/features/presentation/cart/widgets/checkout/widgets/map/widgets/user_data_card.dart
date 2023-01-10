import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class UserDataCard extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  const UserDataCard(
      {super.key, required this.title, required this.controller});

  @override
  State<UserDataCard> createState() => _UserDataCardState();
}

class _UserDataCardState extends State<UserDataCard> {
  @override
  void initState() {
    widget.controller.addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 63.w,
      height: 36.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: ColorStyles.whiteColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomText(
            title: widget.title,
            fontSize: 8.sp,
            fontWeight: FontWeight.w500,
            color: ColorStyles.greyTitleColor,
          ),
          TextField(
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w500,
              fontSize: 17.h,
              color: ColorStyles.blackColor,
            ),
            cursorColor: ColorStyles.accentColor,
            textAlign: TextAlign.center,
            onChanged: (value) {
              if (widget.controller.text.length == 4) {
                widget.controller.text = value;
              }
            },
            controller: widget.controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration.collapsed(
              hintText: '',
              hintStyle: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500,
                fontSize: 12.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
