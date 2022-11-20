import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/core/helpers/images.dart';
import 'package:cofee/features/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/choiced_restaurant.dart';

class ChoiceAdressView extends StatefulWidget {
  const ChoiceAdressView({super.key});

  @override
  State<ChoiceAdressView> createState() => _ChoiceAdressViewState();
}

class _ChoiceAdressViewState extends State<ChoiceAdressView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: 116.h,
              width: 68.w,
              margin: EdgeInsets.only(bottom: 163.h),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Img.berry),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 56.h,
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
                padding: EdgeInsets.only(top: 128.h),
                child: Text(
                  'Выберите адрес заведения',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorStyles.blackColor,
                  ),
                ),
              ),
              Container(
                width: size.width,
                height: 300.w,
                margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 40.h),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return const ChoicedRestaurant(
                      title: "Ресторан Ели-Млели в Ростове",
                      adress:
                          "Доломановский переулок, 70ДБЦ Гвардейский, этаж 1",
                    );
                  },
                ),
              ),
              CustomButton(title: "Готово")
            ],
          ),
        ],
      ),
    );
  }
}
