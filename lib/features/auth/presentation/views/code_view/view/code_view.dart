import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/core/helpers/images.dart';
import 'package:cofee/features/auth/presentation/views/code_view/widgets/code_validator.dart';
import 'package:cofee/features/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CodeView extends StatefulWidget {
  const CodeView({super.key});

  @override
  State<CodeView> createState() => _CodeViewState();
}

class _CodeViewState extends State<CodeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 160.h,
                  left: 16.w,
                  right: 16.w,
                ),
                child: Text(
                  'Введите код из СМС',
                  style: GoogleFonts.montserrat(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: ColorStyles.blackColor,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 119.h,
                  right: 48.w,
                  left: 48.w,
                ),
                child: const CodeValidator(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.h),
                child: Text(
                  'Отправить код еще раз\n( через 57 секунд )',
                  style: GoogleFonts.montserrat(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff515151),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 32.h),
                child: CustomButton(
                  title: 'Подтвердить',
                  onTap: () =>
                      Navigator.of(context).pushNamed('/ChoiceAdressView'),
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: 96.h,
              width: 116.w,
              margin: EdgeInsets.only(bottom: 164.h),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Img.berry),
                  alignment: Alignment.bottomLeft,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
