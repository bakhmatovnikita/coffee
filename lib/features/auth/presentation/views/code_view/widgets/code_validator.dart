import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CodeValidator extends StatefulWidget {
  const CodeValidator({super.key});

  @override
  State<CodeValidator> createState() => _CodeValidatorState();
}

class _CodeValidatorState extends State<CodeValidator> {
  final TextEditingController controllerOne = TextEditingController();
  final TextEditingController controllerTwo = TextEditingController();
  final TextEditingController controllerThree = TextEditingController();
  final TextEditingController controllerFour = TextEditingController();
  final TextEditingController controllerFive = TextEditingController();
  final TextEditingController controllerSix = TextEditingController();
  @override
  void initState() {
    controllerOne.addListener(() {});
    controllerTwo.addListener(() {});
    controllerThree.addListener(() {});
    controllerFour.addListener(() {});
    controllerFive.addListener(() {});
    controllerSix.addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 48.h,
            width: 40.w,
            child: TextFormField(
              showCursor: false,
              style: GoogleFonts.montserrat(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                } else if (value.isEmpty) {
                  FocusScope.of(context);
                } else {
                  FocusScope.of(context).previousFocus();
                }
                setState(() {});
              },
              controller: controllerOne,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: controllerOne.text.isNotEmpty
                        ? const Color(0xff515151)
                        : const Color(0xffCDCDCD),
                    width: 3,
                  ),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xff515151),
                    width: 3,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 48.h,
            width: 40.w,
            child: TextFormField(
              showCursor: false,
              style: GoogleFonts.montserrat(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                } else {
                  FocusScope.of(context).previousFocus();
                }
                setState(() {});
              },
              controller: controllerTwo,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: controllerTwo.text.isNotEmpty
                        ? const Color(0xff515151)
                        : const Color(0xffCDCDCD),
                    width: 3,
                  ),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xff515151),
                    width: 3,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 48.h,
            width: 40.w,
            child: TextFormField(
              showCursor: false,
              style: GoogleFonts.montserrat(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                } else {
                  FocusScope.of(context).previousFocus();
                }
                setState(() {});
              },
              controller: controllerThree,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: controllerThree.text.isNotEmpty
                        ? const Color(0xff515151)
                        : const Color(0xffCDCDCD),
                    width: 3,
                  ),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xff515151),
                    width: 3,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 48.h,
            width: 40.w,
            child: TextFormField(
              showCursor: false,
              style: GoogleFonts.montserrat(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                } else {
                  FocusScope.of(context).previousFocus();
                }
                setState(() {});
              },
              controller: controllerFour,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: controllerFour.text.isNotEmpty
                        ? const Color(0xff515151)
                        : const Color(0xffCDCDCD),
                    width: 3,
                  ),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xff515151),
                    width: 3,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 48.h,
            width: 40.w,
            child: TextFormField(
              showCursor: false,
              style: GoogleFonts.montserrat(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                } else {
                  FocusScope.of(context).previousFocus();
                }
                setState(() {});
              },
              controller: controllerFive,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: controllerFive.text.isNotEmpty
                        ? const Color(0xff515151)
                        : const Color(0xffCDCDCD),
                    width: 3,
                  ),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xff515151),
                    width: 3,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 48.h,
            width: 40.w,
            child: TextFormField(
              showCursor: false,
              style: GoogleFonts.montserrat(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).unfocus();
                } else {
                  FocusScope.of(context).previousFocus();
                }
                setState(() {});
              },
              controller: controllerSix,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: controllerSix.text.isNotEmpty
                        ? const Color(0xff515151)
                        : const Color(0xffCDCDCD),
                    width: 3,
                  ),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xff515151),
                    width: 3,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
