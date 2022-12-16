import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/core/helpers/images.dart';
import 'package:cofee/custom_widgets/custom_button.dart';
import 'package:cofee/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Congratulations extends StatefulWidget {
  const Congratulations({super.key});

  @override
  State<Congratulations> createState() => CcongratulationsState();
}

class CcongratulationsState extends State<Congratulations> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 157.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: const AssetImage(Img.congratulations),
            height: 80.h,
            width: 80.w,
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.h),
            child: CustomText(
              title: 'Заказ №5678',
              centerTitle: true,
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: ColorStyles.greyTitleColor,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.h),
            child: CustomText(
              title: 'Заказ оформлен!',
              centerTitle: true,
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: ColorStyles.blackColor,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.h),
            child: CustomText(
              title:
                  'Заберите заказ в среду, в 8:15\nКогда заказ будет готов, вы получите\nуведомление',
              centerTitle: true,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 32.h),
            child: CustomButton(
              title: 'Понятно',
              onTap: () => Navigator.of(context).pop(),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.h),
            child: CustomText(
              title:
                  'Внимание: вы можете изменить заказ\nдо 20:00 во Вторник (17.09.2022)',
              centerTitle: true,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: ColorStyles.greyTitleColor,
            ),
          ),
        ],
      ),
    );
  }
}
