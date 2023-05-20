import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/custom_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../custom_widgets/custom_text.dart';

class ReturnOrderBottomSheet extends StatefulWidget {
  const ReturnOrderBottomSheet({super.key});

  @override
  State<ReturnOrderBottomSheet> createState() => _ReturnOrderBottomSheetState();
}

class _ReturnOrderBottomSheetState extends State<ReturnOrderBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(
              top: 27.h, bottom: 31.h, left: 25.5.w, right: 16.w),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: ColorStyles.accentColor,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: CustomText(
                  title: 'Возврат',
                  fontSize: 17,
                  color: ColorStyles.blackColor,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            right: 16.w,
            left: 16.w,
            top: 24.h,
            bottom: 8.h,
          ),
          child: CustomText(
            title: 'Поскольку вы изменили заказ, его сумма уменьшилась.',
            fontSize: 17.sp,
            fontWeight: FontWeight.w500,
            color: ColorStyles.blackColor,
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            right: 16.w,
            left: 16.w,
            top: 8.h,
            bottom: 24.h,
          ),
          child: CustomText(
            title: 'Будет зачислено 145 ₽ на ваш бонусный счет',
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: ColorStyles.accentColor,
          ),
        ),
        CustomButton(title: 'OK',)
      ],
    );
  }
}
