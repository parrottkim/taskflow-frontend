import 'package:flutter/services.dart';

class DecimalInputFormatter extends TextInputFormatter {
  static const separator = ','; // 천의 자리 구분 기호
  static const decimal = '.'; // 소수점 구분 기호

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // 1. 기존 값과 새 값에서 천의 자리 구분 기호(,)를 모두 제거
    String newString = newValue.text.replaceAll(separator, '');

    // 2. 비숫자 및 소수점(.) 이외의 모든 문자를 제거
    // (첫 번째 소수점 이후의 추가 소수점도 제거)
    newString = newString.replaceAll(RegExp(r'[^\d\.]'), '');

    // 3. 소수점 처리: 첫 번째 소수점만 허용하고 나머지는 제거
    final parts = newString.split(decimal);
    if (parts.length > 2) {
      newString = parts[0] + decimal + parts.sublist(1).join();
    }

    // 만약 비숫자 문자를 제거한 후의 값이 비어있다면, 그대로 반환
    if (newString.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // --- 정수부와 소수부 분리 ---
    String integerPart;
    String decimalPart = '';

    if (newString.contains(decimal)) {
      final split = newString.split(decimal);
      integerPart = split[0];
      if (split.length > 1) {
        decimalPart = decimal + split[1];
      }
    } else {
      integerPart = newString;
    }

    // --- 정수부에 천의 자리 구분 기호 적용 ---
    String formattedIntegerPart = '';
    final chars = integerPart.split('');

    // 커서 위치 보정을 위해 원래 텍스트 길이와 새 텍스트 길이 차이 계산
    int selectionIndex = newValue.text.length - newValue.selection.extentOffset;

    // 4. 정수부에 쉼표 추가
    for (int i = chars.length - 1; i >= 0; i--) {
      // 세 자리마다 쉼표 추가 (가장 앞이 아닌 경우)
      if ((chars.length - 1 - i) % 3 == 0 && i != chars.length - 1) {
        formattedIntegerPart = separator + formattedIntegerPart;
      }
      formattedIntegerPart = chars[i] + formattedIntegerPart;
    }

    // 5. 정수부와 소수부 합치기
    String formattedString = formattedIntegerPart + decimalPart;

    // 6. 새로운 커서 위치 계산 및 반환
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
