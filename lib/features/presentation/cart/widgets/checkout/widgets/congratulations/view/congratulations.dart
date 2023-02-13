import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/core/helpers/images.dart';
import 'package:cofee/custom_widgets/custom_button.dart';
import 'package:cofee/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../constants/constants_for_back/constants.dart';
import '../../../../../../../../core/services/auth_config/time_accept.dart';
import '../../../../../../../../injection.container.dart';

class Congratulations extends StatefulWidget {
  const Congratulations({super.key});

  @override
  State<Congratulations> createState() => CcongratulationsState();
}

class CcongratulationsState extends State<Congratulations> {
  final String textWithNull =
      '${DateTime.now().day}.0${DateTime.now().month}.${DateTime.now().year}';
  final String textWithoutNull =
      '${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}';
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
                  'Заберите заказ в ${sl<AcceptTime>().weekDay}, в ${sl<AcceptTime>().time}\nКогда заказ будет готов, вы получите\nуведомление',
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
                  'Внимание: вы можете изменить заказ\nдо 20:00 ${BackConstants.weekDaysForCon[DateTime.now().weekday]} (${DateTime.now().month > 9 ? textWithoutNull : textWithNull})',
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
