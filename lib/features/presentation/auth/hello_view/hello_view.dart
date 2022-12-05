import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/core/helpers/images.dart';
import 'package:cofee/features/presentation/auth/choice_adress/view/choice_adress.dart';
import 'package:cofee/custom_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HelloView extends StatelessWidget {
  const HelloView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 415.h,
            width: 550.w,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Img.backgroundImg),
                alignment: Alignment.topLeft,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 90.h),
              child: Image.asset(
                Img.dish,
                height: 307.h,
                width: 296.w,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 383.h,
            left: 16.w,
            child: Padding(
              padding: EdgeInsets.only(top: 6.h),
              child: SizedBox(
                width: 343.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Ели Млели",
                          style: GoogleFonts.montserrat(
                            fontSize: 40,
                            color: ColorStyles.accentColor,
                            fontWeight: FontWeight.w500,
                            height: 1,
                          ),
                        ),
                        Text(
                          " -",
                          style: GoogleFonts.montserrat(
                            fontSize: 40,
                            color: ColorStyles.blackColor,
                            fontWeight: FontWeight.w500,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "ресторан",
                      style: GoogleFonts.montserrat(
                        fontSize: 40,
                        color: ColorStyles.blackColor,
                        fontWeight: FontWeight.w500,
                        height: 1,
                      ),
                    ),
                    Text(
                      "быстрого",
                      style: GoogleFonts.montserrat(
                        fontSize: 40,
                        color: ColorStyles.blackColor,
                        fontWeight: FontWeight.w500,
                        height: 1,
                      ),
                    ),
                    Text(
                      "обслуживания",
                      style: GoogleFonts.montserrat(
                        fontSize: 40,
                        color: ColorStyles.blackColor,
                        fontWeight: FontWeight.w500,
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 190.h),
              child: CustomButton(
                title: 'Войти по номеру телефона',
                onTap: () => Navigator.of(context).pushNamed('/LoginView'),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                top: 28.h,
                bottom: 137.h,
              ),
              child: CustomButton(
                title: 'Пропустить',
                accent: false,
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ChoiceAdressView()))
              ),
            ),
          )
        ],
      ),
    );
  }
}
