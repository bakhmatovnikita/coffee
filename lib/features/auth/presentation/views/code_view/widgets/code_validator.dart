import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CodeValidator extends StatefulWidget {
  final TextEditingController controllerOne;
  final TextEditingController controllerTwo;
  final TextEditingController controllerThree;
  final TextEditingController controllerFour;
  final TextEditingController controllerFive;
  final TextEditingController controllerSix;
  const CodeValidator({
    super.key,
    required this.controllerOne,
    required this.controllerTwo,
    required this.controllerThree,
    required this.controllerFour,
    required this.controllerFive,
    required this.controllerSix,
  });

  @override
  State<CodeValidator> createState() => _CodeValidatorState();
}

class _CodeValidatorState extends State<CodeValidator> {
  final FocusNode focusNodeOne = FocusNode();
  final FocusNode focusNodeTwo = FocusNode();
  @override
  void initState() {
    widget.controllerOne.addListener(() {});
    widget.controllerTwo.addListener(() {});
    widget.controllerThree.addListener(() {});
    widget.controllerFour.addListener(() {});
    widget.controllerFive.addListener(() {});
    widget.controllerSix.addListener(() {});
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
              autofocus: true,
              onTap: () {
                // focusNodeOne.requestFocus(focusNodeOne);
              },
              showCursor: false,
              style: GoogleFonts.montserrat(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              onChanged: (value) {
                print('object');
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                } else if (value.isEmpty) {
                  FocusScope.of(context);
                } else {
                  FocusScope.of(context).previousFocus();
                }
                setState(() {});
              },
              controller: widget.controllerOne,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: widget.controllerOne.text.isNotEmpty
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
              focusNode: focusNodeTwo,
              showCursor: false,
              style: GoogleFonts.montserrat(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              onTap: () {
                setState(() {});
              },
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                } else {
                  FocusScope.of(context).previousFocus();
                }
                setState(() {});
              },
              controller: widget.controllerTwo,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: widget.controllerTwo.text.isNotEmpty
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
              controller: widget.controllerThree,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: widget.controllerThree.text.isNotEmpty
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
              controller: widget.controllerFour,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: widget.controllerFour.text.isNotEmpty
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
              controller: widget.controllerFive,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: widget.controllerFive.text.isNotEmpty
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
              controller: widget.controllerSix,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: widget.controllerSix.text.isNotEmpty
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
