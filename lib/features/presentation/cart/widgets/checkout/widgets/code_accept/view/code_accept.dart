import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/custom_widgets/custom_button.dart';
import 'package:cofee/custom_widgets/custom_text.dart';
import 'package:cofee/custom_widgets/push_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sms_autofill/sms_autofill.dart';

class CodeAccept extends StatefulWidget {
  final PageController pageController;
  const CodeAccept({super.key, required this.pageController});

  @override
  State<CodeAccept> createState() => _CodeAcceptState();
}

class _CodeAcceptState extends State<CodeAccept> {
  final TextEditingController controller = TextEditingController();
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
                title: 'Шаг 4',
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
                  title: 'Введите полученный код, для\nподтверждения заказа',
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 16.w, left: 16.w, top: 56.h),
                child: PinFieldAutoFill(
                  controller: controller,
                  autoFocus: true,
                  keyboardType: TextInputType.number,
                  decoration: UnderlineDecoration(
                    textStyle: GoogleFonts.montserrat(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    colorBuilder: PinListenColorBuilder(
                      const Color(0xff515151),
                      const Color(0xffCDCDCD),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        CustomButton(
          title: "Далее",
          onTap: () {
            if (controller.text.isEmpty || controller.text != "123456") {
              SmartDialog.show(
                animationType: SmartAnimationType.fade,
                maskColor: Colors.transparent,
                displayTime: const Duration(seconds: 3),
                clickMaskDismiss: false,
                usePenetrate: true,
                builder: (context) => const SafeArea(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: PushError(
                      title: 'Введен неверный код',
                    ),
                  ),
                ),
              );
            } else {
              FocusScope.of(context).unfocus();
              setState(
                () {
                  widget.pageController.nextPage(
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeInOutQuint,
                  );
                },
              );
            }
          },
        ),
      ],
    );
  }
}
