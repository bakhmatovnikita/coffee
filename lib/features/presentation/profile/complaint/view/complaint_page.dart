import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/core/helpers/images.dart';
import 'package:cofee/custom_widgets/custom_button.dart';
import 'package:cofee/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ComplaintPage extends StatefulWidget {
  final int? numberOrder;
  const ComplaintPage({super.key, required this.numberOrder});

  @override
  State<ComplaintPage> createState() => CcomplaintStatePage();
}

class CcomplaintStatePage extends State<ComplaintPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 25.w,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: SvgPicture.asset(
                      SvgImg.goBackk,
                      height: 17.82.h,
                      width: 10.26.w,
                      color: ColorStyles.accentColor,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.center,
                child: CustomText(
                  title: 'Пожаловаться',
                  color: ColorStyles.blackColor,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Padding(
                  padding: EdgeInsets.only(
                    right: 25.w,
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: SvgPicture.asset(
                      SvgImg.cross,
                      height: 13.64.h,
                      width: 13.64.w,
                      color: ColorStyles.accentColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16.w, top: 32.h),
                child: CustomText(
                  title: 'Жалоба к заказу №${widget.numberOrder}',
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w500,
                  color: ColorStyles.greyTitleColor,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.w, top: 8.h, right: 16.w),
                child: CustomText(
                  title: 'Что вам не понравилось? Опишите свою проблему',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: ColorStyles.blackColor,
                ),
              ),
              Container(
                height: 324,
                width: size.width,
                margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: ColorStyles.whiteColor,
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  child: TextField(
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      fontSize: 17.h,
                      color: ColorStyles.blackColor,
                    ),
                    maxLines: 15,
                    scrollPhysics: const NeverScrollableScrollPhysics(),
                    cursorColor: ColorStyles.accentColor,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration.collapsed(
                      hintText: 'Описание проблемы',
                      hintStyle: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        fontSize: 17.h,
                      ),
                    ),
                  ),
                ),
              ),
              CustomButton(title: 'Отправить жалобу')
            ],
          ),
        ),
      ],
    );
  }
}
