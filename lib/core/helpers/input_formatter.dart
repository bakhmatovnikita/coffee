import 'package:flutter/services.dart';

class CustomInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.text.length < oldValue.text.length) {
      return newValue;
    }

    if (text.isNotEmpty && text[0] == '8') {
      if (text.length == 1) {
        return oldValue.copyWith(
          text: '$text (',
          selection: TextSelection.collapsed(offset: text.length + 2),
        );
      } else if (text.length == 6) {
        return oldValue.copyWith(
          text: '$text) ',
          selection: TextSelection.collapsed(offset: text.length + 2),
        );
      } else if (text.length == 11) {
        return oldValue.copyWith(
          text: '$text-',
          selection: TextSelection.collapsed(offset: text.length + 1),
        );
      } else if (text.length == 14) {
        return oldValue.copyWith(
          text: '$text-',
          selection: TextSelection.collapsed(offset: text.length + 1),
        );
      }
      if (text.length > 17) {
        return oldValue;
      }
    } else if (text.isNotEmpty && text[0] == '7' || text[0] == '+') {
      if (text.length == 1) {
        return oldValue.copyWith(
          text: '+$text (',
          selection: TextSelection.collapsed(offset: text.length + 3),
        );
      } else if (text.length == 7) {
        return oldValue.copyWith(
          text: '$text) ',
          selection: TextSelection.collapsed(offset: text.length + 2),
        );
      } else if (text.length == 12) {
        return oldValue.copyWith(
          text: '$text-',
          selection: TextSelection.collapsed(offset: text.length + 1),
        );
      } else if (text.length == 15) {
        return oldValue.copyWith(
          text: '$text-',
          selection: TextSelection.collapsed(offset: text.length + 1),
        );
      }

      if (text.length > 18) {
        return oldValue;
      }
    } else {
      return oldValue;
    }

    return newValue.copyWith(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}
