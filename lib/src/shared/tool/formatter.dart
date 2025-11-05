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

class UrlPrefixFormatter extends TextInputFormatter {
  static const String httpPrefix = 'http://';
  static const String httpsPrefix = 'https://';

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // 1. 현재 텍스트가 두 접두사 중 어느 것으로도 시작하지 않는지 확인
    if (!newValue.text.startsWith(httpPrefix) &&
        !newValue.text.startsWith(httpsPrefix)) {
      // 2. 사용자가 새로 입력한 텍스트를 추정하여 가져옵니다.
      // (사용자가 지우기(backspace) 버튼을 누르거나, 복잡한 붙여넣기를 하는 경우를 단순화하여 처리)
      String currentInput = '';
      if (newValue.text.length > oldValue.text.length) {
        // 새로 입력된 문자가 있다면
        currentInput = newValue.text.substring(oldValue.text.length);
      } else if (newValue.text.length < oldValue.text.length) {
        // 지우기 동작을 했다면, 사용자가 가장 앞에 있는 문자를 지우려고 했을 가능성이 높으므로
        // 지우기 동작을 무시하고 현재 커서 위치 이후의 텍스트만 복구합니다.
        final int cursorOffset = oldValue.selection.start;
        if (cursorOffset >= httpPrefix.length ||
            cursorOffset >= httpsPrefix.length) {
          // 접두사 이후의 텍스트를 지운 경우 (단순화된 처리)
          currentInput =
              newValue.text.substring(httpPrefix.length); // http:// 기준
        } else {
          // 접두사 자체를 지우려고 시도한 경우, currentInput은 비어 있게 됩니다.
        }
      } else {
        // 텍스트는 바뀌지 않았지만 커서가 움직인 경우 등
        return newValue;
      }

      // 3. 포맷된 텍스트 생성: 기본값으로 https://를 선택하고 사용자 입력을 붙입니다.
      String newText = httpPrefix + currentInput;

      // 4. 새로운 커서 위치 계산
      int newSelectionOffset = httpPrefix.length + currentInput.length;

      // 5. 업데이트된 TextEditingValue 반환
      return TextEditingValue(
        text: newText,
        selection: TextSelection.collapsed(offset: newSelectionOffset),
      );
    }

    // 6. 접두사가 이미 존재하고 유효한 입력인 경우, 그대로 반환
    // (예: http:// -> https://로 변경하는 것은 이 포맷터 로직에서 허용됨)
    return newValue;
  }
}
