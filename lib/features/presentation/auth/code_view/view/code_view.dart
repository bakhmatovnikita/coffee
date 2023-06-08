import 'dart:async';

import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/core/helpers/images.dart';
import 'package:cofee/custom_widgets/custom_button.dart';
import 'package:cofee/custom_widgets/push_error.dart';
import 'package:cofee/features/presentation/auth/login_view/controller/login_view_cubit.dart';
import 'package:cofee/features/presentation/auth/login_view/controller/login_view_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sms_autofill/sms_autofill.dart';

class CodeView extends StatefulWidget {
  final String phone;
  const CodeView({super.key, required this.phone});

  @override
  State<CodeView> createState() => _CodeViewState();
}

class _CodeViewState extends State<CodeView> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    controller.addListener(() {});
    super.initState();
    listen();
  }

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    controller.dispose();
    super.dispose();
  }

  void listen() async {
    SmsAutoFill().listenForCode;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginViewCubit, LoginViewState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 160.h,
                      left: 16.w,
                      right: 16.w,
                    ),
                    child: Text(
                      'Введите код из СМС',
                      style: GoogleFonts.montserrat(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: ColorStyles.blackColor,
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                        top: 119.h,
                        right: 48.w,
                        left: 48.w,
                      ),
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
                      )),
                  const TimerWidget(),
                  Padding(
                    padding: EdgeInsets.only(top: 32.h),
                    child: CustomButton(
                      title: 'Подтвердить',
                      onTap: () async {
                        if (state is LoginViewSavedState) {
                          if (controller.text.isNotEmpty ||
                              controller.text == state.code) {
                            Navigator.of(context).pushNamed(
                              '/ChoiceAdressView',
                              arguments: {
                                'phone': widget.phone,
                              },
                            );
                          } else {
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
                          }
                        }
                      },
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  height: 96.h,
                  width: 116.w,
                  margin: EdgeInsets.only(bottom: 164.h),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Img.berry),
                      alignment: Alignment.bottomLeft,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class TimerWidget extends StatefulWidget {
  const TimerWidget({
    super.key,
  });

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late Timer _timer;
  int _start = 60;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h),
      child: Text(
        'Отправить код еще раз\n( через $_start секунд )',
        style: GoogleFonts.montserrat(
          fontSize: 17,
          fontWeight: FontWeight.w500,
          color: const Color(0xff515151),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
