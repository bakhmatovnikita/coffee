import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/custom_widgets/custom_button.dart';
import 'package:cofee/custom_widgets/custom_text.dart';
import 'package:cofee/custom_widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NumberAccept extends StatefulWidget {
  final PageController pageController;
  const NumberAccept({super.key, required this.pageController});

  @override
  State<NumberAccept> createState() => _NumberAcceptState();
}

class _NumberAcceptState extends State<NumberAccept> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 16.w, left: 16.w, bottom: 32.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                title: 'Шаг 2',
                color: ColorStyles.greyTitleColor,
                fontSize: 17.sp,
                fontWeight: FontWeight.w500,
              ),
              Container(
                margin: EdgeInsets.only(top: 4.h),
                child: CustomText(
                  title: 'Подтверждение заказа',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8.h),
                child: CustomText(
                  title: 'Введите свой номер, чтобы\nполучить код',
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.h),
                child: CustomTextField(
                  color: ColorStyles.whiteColor,
                  controller: textEditingController,
                  type: TextInputType.number,
                ),
              ),
            ],
          ),
        ),
        CustomButton(
          title: "Получить код",
          onTap: () {
            setState(
              () {
                widget.pageController.nextPage(
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeInOutQuint,
                );
              },
            );
          },
        ),
      ],
    );
  }
}
