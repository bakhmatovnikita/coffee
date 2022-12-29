import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/core/helpers/images.dart';
import 'package:cofee/custom_widgets/custom_button.dart';
import 'package:cofee/custom_widgets/custom_text.dart';
import 'package:cofee/custom_widgets/custom_text_cart_field.dart';
import 'package:cofee/custom_widgets/custom_text_cart_field_cvv.dart';
import 'package:cofee/custom_widgets/custom_text_cart_field_date.dart';
import 'package:cofee/custom_widgets/not_have_day.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class AddedCart extends StatefulWidget {
  const AddedCart({super.key});

  @override
  State<AddedCart> createState() => _AddedCartState();
}

class _AddedCartState extends State<AddedCart> {
  final TextEditingController controller = TextEditingController();
  final TextEditingController controllerDate = TextEditingController();
  final TextEditingController controllerCvv = TextEditingController();
  



  int currentDialogStyle = 0;
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Padding(
                  padding: EdgeInsets.only(left: 25.5.w),
                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: ColorStyles.accentColor,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: CustomText(
                  title: 'Добавить карту',
                  color: ColorStyles.blackColor,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 24.h, left: 16.w),
            child: CustomText(
              title: 'Мы поддерживаем',
              color: ColorStyles.blackColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.h, left: 16.w, bottom: 32.h),
            child: Row(
              children: [
                Image(
                  image: const AssetImage(
                    Img.visa,
                  ),
                  height: 32.h,
                  width: 64.w,
                ),
                Image(
                  image: const AssetImage(
                    Img.masterCart,
                  ),
                  height: 32.h,
                  width: 64.w,
                ),
                Image(
                  image: const AssetImage(
                    Img.masterCartBlack,
                  ),
                  height: 32.h,
                  width: 64.w,
                ),
                Image(
                  image: const AssetImage(
                    Img.world,
                  ),
                  height: 32.h,
                  width: 64.w,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.w, bottom: 16.h),
            child: CustomText(
              title: 'Номер карты',
              color: ColorStyles.blackColor,
              fontSize: 17.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          CustomTextCartField(
            color: ColorStyles.whiteColor,
            controller: controller,
            type: TextInputType.number,
          ),
          Padding(
            padding: EdgeInsets.only(top: 32.h),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 16.w),
                  height: 81.h,
                  width: 163.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        title: 'Срок действия',
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                      const Spacer(),
                      CustomTextCartFieldDate(
                        color: ColorStyles.whiteColor,
                        controller: controllerDate,
                        type: TextInputType.number,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16.w),
                  height: 81.h,
                  width: 163.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        title: 'CVC/CVV',
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                      const Spacer(),
                      CustomTextCartFieldCvv(
                        color: ColorStyles.whiteColor,
                        controller: controllerCvv,
                        type: TextInputType.number,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 24.h),
            child: CustomButton(
              title: 'Добавить',
              onTap: () {
                SmartDialog.show(
                  animationType: SmartAnimationType.fade,
                  builder: (context) => const SafeArea(
                    child: Align(
                        alignment: Alignment.center,
                        child: NotHaveDay()),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 32.h, left: 16.w, right: 16.w),
            child: CustomText(
              title:
                  'ВАША КАРТА БУДЕТ ОТОБРОЖАТЬСЯ В ЛИЧНОМ КАБИНЕТЕ, В РАЗДЕЛЕ "СПОСОБЫ ОПЛЫТЫ"',
              color: ColorStyles.greyTitleColor,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
