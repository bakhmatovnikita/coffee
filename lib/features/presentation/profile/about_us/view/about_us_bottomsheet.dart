import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constants/colors/color_styles.dart';
import '../../../../../core/helpers/images.dart';
import '../../../../../custom_widgets/custom_text.dart';

class AboutUsBottomsheet extends StatefulWidget {
  const AboutUsBottomsheet({super.key});

  @override
  State<AboutUsBottomsheet> createState() => _AboutUsBottomsheetState();
}

class _AboutUsBottomsheetState extends State<AboutUsBottomsheet> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: Stack(
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Padding(
                  padding: EdgeInsets.only(left: 25.w, top: 5),
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
              Align(
                alignment: Alignment.center,
                child: CustomText(
                  title: 'О нас',
                  color: ColorStyles.blackColor,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      title: 'Добро пожаловать.',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: ColorStyles.blackColor,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.w),
                      child: CustomText(
                        title:
                            'В ресторане быстрого обслуживания «Ели-Млели» вас ждут простые и вкусные блюда русской и европейской кухонь по демократичным ценам, а также быстрое обслуживание, постоянно обновляемое меню, оригинальный дизайн и теплая дружеская атмосфера!\n\n\nС помощбю мобильного приложения вы можете сделать заказ в одном из наших ресторанов и забрать его без очередей.',
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: ColorStyles.blackColor,
                      ),
                    ),
                    SizedBox(
                      height: 130.h,
                      child: ListView.builder(
                        itemCount: 3,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Container(
                          height: 130,
                          width: 219,
                          color: Colors.red,
                          margin: EdgeInsets.symmetric(horizontal: 5.w),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    CustomText(
                      title: 'Ресторан в Батайске',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16.h),
                      child: CustomText(
                        title: 'Адрес',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    CustomText(
                      title: 'Восточное ш., 14, Батайск',
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16.h),
                      child: CustomText(
                        title: 'Режим работы',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    CustomText(
                      title: 'ПН-ПТ: 08:30–18:00\nВыходной: СБ-ВС',
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16.h),
                      child: CustomText(
                        title: 'Контакты',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    CustomText(
                      title: '+7 (928) 129-61-65',
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    CustomText(
                      title: 'Ресторан в Ростове',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16.h),
                      child: CustomText(
                        title: 'Адрес',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    CustomText(
                      title: 'Доломановский пер., 70ДБЦ\nГвардейский, этаж 1',
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16.h),
                      child: CustomText(
                        title: 'Режим работы',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    CustomText(
                      title: 'ПН-ЧТ: 08:30–18:00\nПТ: 08:30–17:00\nВыходной: СБ-ВС',
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16.h),
                      child: CustomText(
                        title: 'Контакты',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    CustomText(
                      title: '+7 (928) 130-32-77',
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
