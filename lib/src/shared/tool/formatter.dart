import 'package:flutter/services.dart';

class DecimalInputFormatter extends TextInputFormatter {
  static const separator = ','; // 천의 자리 구분 기호
  static const decimal = '.'; // 소수점 구분 기호

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
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
    // 1. 입력값이 비어있으면 그대로 둡니다. (사용자가 다 지울 수 있어야 함)
    if (newValue.text.isEmpty) {
      return newValue;
    }

    // 2. 이미 http:// 나 https:// 로 시작한다면 건드리지 않습니다.
    if (newValue.text.startsWith(httpPrefix) ||
        newValue.text.startsWith(httpsPrefix)) {
      return newValue;
    }

    // 3. 접두사가 없다면 현재 입력된 전체 텍스트 앞에 https://를 붙입니다.
    // 기본적으로 https를 권장하므로 https://를 사용하겠습니다.
    final String fixedText = '$httpPrefix${newValue.text}';

    return TextEditingValue(
      text: fixedText,
      selection: TextSelection.collapsed(
        // 커서 위치를 기존 텍스트 상대 위치만큼 뒤로 밀어줍니다.
        offset: newValue.selection.end + httpPrefix.length,
      ),
    );
  }
}
