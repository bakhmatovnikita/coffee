import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/features/widgets/custom_button.dart';
import 'package:cofee/features/widgets/custom_text.dart';
import 'package:cofee/features/widgets/custom_text_field.dart';
import 'package:cofee/features/widgets/switch_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginBottomsheet extends StatefulWidget {
  const LoginBottomsheet({super.key});

  @override
  State<LoginBottomsheet> createState() => _LoginBottomsheetState();
}

class _LoginBottomsheetState extends State<LoginBottomsheet> {
  bool switchValue = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 758.h,
      decoration: BoxDecoration(
        color: const Color(0xffF3F3F3),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16.r),
          topLeft: Radius.circular(16.r),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 27.h,
              left: 25.5.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.arrow_back_ios),
                  color: ColorStyles.accentColor,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 61.h, left: 16.h, right: 16.h),
            child: CustomText(
              title: 'Введите номер телефона',
              fontSize: 32,
              centerTitle: true,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 87.h, left: 16.h, right: 16.h),
            child: const CustomTextField(
              color: Colors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 24.5.h, left: 16.h, right: 16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  title: 'Я хочу получать уведомления',
                  fontSize: 17.h,
                  fontWeight: FontWeight.w500,
                  centerTitle: false,
                ),
                SwitchBtn(
                  onChange: (value) {
                    setState(() {
                      switchValue = !switchValue;
                    });
                  },
                  value: switchValue,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 42.5.h),
            child: CustomButton(
              title: 'Войти',
              onTap: () {},
              // onTap: () => Navigator.of(context).pushNamed('/CodeView'),
            ),
          ),
        ],
      ),
    );
  }
}
