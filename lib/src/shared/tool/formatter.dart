import 'package:flutter/services.dart';

class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  static const separator = ','; // Change this to '.' for other locales

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // 입력된 값에서 숫자 이외의 모든 문자를 제거
    String newString = newValue.text.replaceAll(RegExp(r'[^\d]'), '');

    // 만약 비숫자 문자를 제거한 후의 값이 비어있다면, 그대로 반환
    if (newString.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // 기존 로직을 적용하여 쉼표 추가
    int selectionIndex = newValue.text.length - newValue.selection.extentOffset;
    final chars = newString.split('');
    String formattedString = '';

    for (int i = chars.length - 1; i >= 0; i--) {
      if ((chars.length - 1 - i) % 3 == 0 && i != chars.length - 1) {
        formattedString = separator + formattedString;
      }
      formattedString = chars[i] + formattedString;
    }

    return TextEditingValue(
      text: formattedString,
      selection: TextSelection.collapsed(
        offset: formattedString.length - selectionIndex,
      ),
    );
  }
}
