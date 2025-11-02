import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Functions {
  final BuildContext context;

  Functions(this.context);

  int maxImageSize = 50 * 1024 * 1024; // Max Size 50MB

  bool canPop(String path) {
    final segments = path.split('/');
    return segments.length > 2;
  }

  Color generateColorFromId(int id, {double contrast = 0.3}) {
    const double goldenRatio = 0.61803398875;

    double base = (id * goldenRatio) % 1.0;

    double hue = 150 + base * (280 - 150);

    double saturation = 0.5;
    double lightness = 0.5;

    lightness = MediaQuery.of(context).platformBrightness == Brightness.dark
        ? lightness + contrast
        : lightness;
    if (lightness > 1.0) lightness = 1.0;
    if (lightness < 0.0) lightness = 0.0;

    final hslColor = HSLColor.fromAHSL(1.0, hue, saturation, lightness);
    return hslColor.toColor();
  }
}

Color hexToColor(String hexString) {
  hexString = hexString.replaceAll('#', ''); // # 제거
  if (hexString.length == 6) {
    hexString = 'FF$hexString'; // 불투명도 기본값 FF 추가
  }
  return Color(int.parse(hexString, radix: 16));
}

String formatRelativeDate(DateTime dateTime) {
  DateTime now = DateTime.now();
  DateTime justNowThreshold = now.subtract(Duration(seconds: 60));
  DateTime localDateTime = dateTime.toLocal();

  if (localDateTime.isAfter(justNowThreshold)) {
    return Intl.message('relative_data_just_now');
  }

  if (now.difference(localDateTime).inHours < 24) {
    // Same day
    int differenceInMinutes = now.difference(localDateTime).inMinutes;
    if (differenceInMinutes == 1) {
      return Intl.message('relative_data_minute_ago');
    } else if (differenceInMinutes < 60) {
      return Intl.message('relative_data_minutes_ago',
          args: [differenceInMinutes]);
    }

    int differenceInHours = now.difference(localDateTime).inHours;
    if (differenceInHours == 1) {
      return Intl.message('relative_data_hour_ago');
    } else if (differenceInHours < 24) {
      return Intl.message('relative_data_hours_ago', args: [differenceInHours]);
    }

    return ''; // Just in case, though this case should be handled already
  }

  if (now.difference(localDateTime).inDays < 7) {
    int differenceInDays = now.difference(localDateTime).inDays;

    if (differenceInDays == 1) {
      return Intl.message('relative_data_yesterday');
    } else if (differenceInDays > 1 && differenceInDays < 7) {
      return Intl.message('relative_data_days_ago', args: [differenceInDays]);
    }
  }

  if (now.difference(localDateTime).inDays < 30) {
    int differenceInWeeks = (now.difference(localDateTime).inDays / 7).floor();
    if (differenceInWeeks == 1) {
      return Intl.message('relative_data_week_ago');
    } else {
      return Intl.message('relative_data_weeks_ago', args: [differenceInWeeks]);
    }
  }

  if (now.difference(localDateTime).inDays < 365) {
    int differenceInMonths = now.difference(localDateTime).inDays ~/ 30;
    if (differenceInMonths == 1) {
      return Intl.message('relative_data_month_ago',
          args: [differenceInMonths]);
    } else {
      return Intl.message('relative_data_month_ago',
          args: [differenceInMonths]);
    }
  }

  int differenceInYears = now.year - localDateTime.year;
  if (differenceInYears == 1) {
    return Intl.message('relative_data_year_ago');
  } else {
    return Intl.message('relative_data_years_ago', args: [differenceInYears]);
  }
}

List<String> getLocalizedDays() {
  // 월요일부터 시작하는 ISO 표준 기반
  final now = DateTime.now();
  final formatter = DateFormat.E(Intl.getCurrentLocale());
  return List.generate(7, (index) {
    final day = now.add(Duration(days: index - now.weekday + 1));
    return formatter.format(day);
  });
}

String getInitials(String name) {
  // 한글 정규식 (가-힣 범위)
  final koreanRegex = RegExp(r'^[가-힣]+$');

  if (name.isEmpty) return '';

  if (koreanRegex.hasMatch(name)) {
    // 한글이면 첫 글자만 반환
    return name[0];
  } else {
    // 영어면 각 단어의 첫 글자를 결합하여 반환
    return name
        .split(' ')
        .where((word) => word.isNotEmpty) // 빈 문자열 제거
        .map((word) => word[0]) // 각 단어의 첫 글자 추출
        .join();
  }
}

bool isDesktopPlatform() {
  return [
    TargetPlatform.macOS,
    TargetPlatform.windows,
    TargetPlatform.linux,
  ].contains(defaultTargetPlatform);
}

String generateRandomIdentifier({int length = 8}) {
  const chars = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789';
  final now = DateTime.now().microsecondsSinceEpoch;
  final randSeed = now ^ Random().nextInt(1 << 31); // ✅ 32비트 제한
  final rand = Random(randSeed);

  return List.generate(length, (_) => chars[rand.nextInt(chars.length)]).join();
}

String formatBytes(int bytes) {
  if (bytes <= 0) return '0 B';

  const suffixes = ['B', 'KB', 'MB', 'GB', 'TB', 'PB'];
  int i = (log(bytes) / log(1024)).floor();

  if (i >= suffixes.length) {
    i = suffixes.length - 1;
  }

  String formattedSize;
  double size = bytes / pow(1024, i);

  if (i >= 2) {
    // MB 이상
    formattedSize = size.toStringAsFixed(1);
  } else {
    // KB 이하
    formattedSize = size.toStringAsFixed(0);
  }

  return '$formattedSize ${suffixes[i]}';
}
