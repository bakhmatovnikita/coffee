import 'package:flutter/services.dart';

class CustomInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digitsOnly = newValue.text.replaceAll(RegExp(r'[^\d]+'), '');
    final digitsOnlyChar = digitsOnly.split('');
    List<String> text = <String>[];
    for (var i = 0; i < digitsOnlyChar.length; i++) {
      if (i == 0) {
        if (digitsOnlyChar[0] == "7" || digitsOnlyChar[0] == "8") {
          text.add("+7 (");
        } else {
          text.add("+7 (");
          text.add(digitsOnlyChar[i]);
        }
      } else if (i == 4) {
        text.add(") ");
        text.add(digitsOnlyChar[i]);
      } else if (i == 7 || i == 9) {
        text.add("-");
        text.add(digitsOnlyChar[i]);
      } else if (i > 10) {
        break;
      } else {
        text.add(digitsOnlyChar[i]);
      }
    }

    final resultText = text.join('');

    return TextEditingValue(
      text: resultText,
      selection: TextSelection.collapsed(
        offset: resultText.length,
      ),
    );
  }
}
