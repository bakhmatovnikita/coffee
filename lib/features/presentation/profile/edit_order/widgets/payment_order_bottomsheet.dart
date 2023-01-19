import 'dart:async';

import 'package:cofee/custom_widgets/custom_button.dart';
import 'package:cofee/custom_widgets/custom_text.dart';
import 'package:cofee/features/presentation/profile/edit_order/widgets/shipping_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constants/colors/color_styles.dart';
import '../../../../../core/helpers/images.dart';

class PaymentOrderBottomsheet extends StatefulWidget {
  const PaymentOrderBottomsheet({super.key});

  @override
  State<PaymentOrderBottomsheet> createState() =>
      _PaymentOrderBottomsheetState();
}

class _PaymentOrderBottomsheetState extends State<PaymentOrderBottomsheet> {
  List<Map<String, dynamic>> wayOfObtaining = [
    {
      'isSelected': true,
      'title': "С внутреннего счета",
    },
    {
      'isSelected': true,
      'title': "Картой",
    },
  ];
  final streamController = StreamController<int>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
        stream: streamController.stream,
        initialData: 0,
        builder: (context, snapshot) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                        title: 'Оплата',
                        color: ColorStyles.blackColor,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: 16.w,
                          left: 67.w,
                        ),
                        child: CustomText(
                          title: 'Отмена',
                          color: ColorStyles.accentColor,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: CustomText(
                  title:
                      'Поскольку вы изменили заказ, его сумма увеличилась. Необходимо доплатить новую сумму',
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: ColorStyles.blackColor,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.w),
                child: CustomText(
                  title: 'К доплате 242 ₽',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: ColorStyles.accentColor,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                child: Divider(
                  height: 1.h,
                  color: ColorStyles.greyTitleColor,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.w, bottom: 16.h),
                child: CustomText(
                  title: 'Выберите способ оплаты',
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              ListView.builder(
                padding: const EdgeInsets.all(0),
                shrinkWrap: true,
                itemCount: wayOfObtaining.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => streamController.sink.add(index),
                  child: ShippingOptions(
                    title: wayOfObtaining[index]['title'],
                    isSelected: snapshot.data! == index
                        ? wayOfObtaining[index]['isSelected'] = true
                        : wayOfObtaining[index]['isSelected'] = false,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 24.h),
                child: CustomButton(
                  title: 'Оплатить',
                ),
              )
            ],
          );
        });
  }
}
