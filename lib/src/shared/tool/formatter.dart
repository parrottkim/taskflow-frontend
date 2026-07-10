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

class BusinessNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // 1. 입력된 텍스트에서 숫자만 추출
    final cleanText = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    // 2. 텍스트가 완전히 비었거나 지워진 경우 완전히 초기화된 상태를 반환
    // (TextSelection.empty를 사용하여 렌더링 엔진에 빈 상태임을 명확히 인지시킴)
    if (cleanText.isEmpty) {
      return TextEditingValue.empty;
    }

    // 사업자등록번호 최대 10자리 제한
    final limitedText = cleanText.length > 10
        ? cleanText.substring(0, 10)
        : cleanText;

    // 3. 하이픈 포맷팅 진행
    final buffer = StringBuffer();
    for (int i = 0; i < limitedText.length; i++) {
      buffer.write(limitedText[i]);
      if ((i == 2 || i == 4) && i != limitedText.length - 1) {
        buffer.write('-');
      }
    }

    final formattedText = buffer.toString();

    // 4. 커서(Selection) 위치 계산
    int targetCursorPosition = newValue.selection.end;

    int countDigitsBeforeCursor = 0;
    for (int i = 0; i < targetCursorPosition; i++) {
      if (i < newValue.text.length &&
          RegExp(r'[0-9]').hasMatch(newValue.text[i])) {
        countDigitsBeforeCursor++;
      }
    }

    int realOffset = 0;
    int digitCount = 0;

    while (realOffset < formattedText.length &&
        digitCount < countDigitsBeforeCursor) {
      if (formattedText[realOffset] != '-') {
        digitCount++;
      }
      realOffset++;
    }

    if (oldValue.text.length > newValue.text.length &&
        realOffset > 0 &&
        formattedText[realOffset - 1] == '-') {
      realOffset--;
    }

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(
        offset: realOffset > formattedText.length
            ? formattedText.length
            : realOffset,
      ),
    );
  }
}

class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final numbers = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    if (numbers.isEmpty) {
      return const TextEditingValue(
        text: '',
        selection: TextSelection.collapsed(offset: 0),
      );
    }

    // 최대 11자리
    final value = numbers.length > 11 ? numbers.substring(0, 11) : numbers;

    String formatted;

    if (value.startsWith('02')) {
      // 서울 지역번호
      if (value.length <= 2) {
        formatted = value;
      } else if (value.length <= 5) {
        formatted = '${value.substring(0, 2)}-${value.substring(2)}';
      } else if (value.length <= 9) {
        formatted =
            '${value.substring(0, 2)}-${value.substring(2, value.length - 4)}-${value.substring(value.length - 4)}';
      } else {
        formatted =
            '${value.substring(0, 2)}-${value.substring(2, 6)}-${value.substring(6)}';
      }
    } else {
      // 휴대폰 및 기타 지역번호
      if (value.length <= 3) {
        formatted = value;
      } else if (value.length <= 6) {
        formatted = '${value.substring(0, 3)}-${value.substring(3)}';
      } else if (value.length <= 10) {
        formatted =
            '${value.substring(0, 3)}-${value.substring(3, value.length - 4)}-${value.substring(value.length - 4)}';
      } else {
        formatted =
            '${value.substring(0, 3)}-${value.substring(3, 7)}-${value.substring(7)}';
      }
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
