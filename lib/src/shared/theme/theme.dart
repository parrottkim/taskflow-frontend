import 'package:flex_seed_scheme/flex_seed_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';

class KeyColor {
  static Color primary = const Color(0xFF78909C);
  static Color secondary = const Color(0xFF8D9194);
  static Color tertiary = const Color(0xFF928F9B);
  static Color error = const Color(0xFFFF5449);
  static Color neutral = const Color(0xFF919091);
  static Color neutralVariant = const Color(0xFF909192);
}

extension PercentageLetterSpacing on TextStyle {
  TextStyle withLetterSpacing(double percentage) {
    double letterSpacing = double.parse(
      ((percentage / 100) * fontSize!).toStringAsFixed(2),
    ); // toStringAsFixed(2): to two decimal places
    return copyWith(letterSpacing: letterSpacing);
  }
}

TextTheme textTheme = TextTheme(
  displayLarge: const TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: 'Pretendard',
    fontSize: 57.0,
    height: 1.3333,
  ).withLetterSpacing(-2),
  displayMedium: const TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: 'Pretendard',
    fontSize: 45.0,
    height: 1.3333,
  ).withLetterSpacing(-2),
  displaySmall: const TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: 'Pretendard',
    fontSize: 36.0,
    height: 1.3333,
  ).withLetterSpacing(-2),
  headlineLarge: const TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 32.0,
    height: 1.3333,
  ).withLetterSpacing(-2),
  headlineMedium: const TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: 'Pretendard',
    fontSize: 28.0,
    height: 1.3333,
  ).withLetterSpacing(-2),
  headlineSmall: const TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: 'Pretendard',
    fontSize: 24.0,
    height: 1.3333,
  ).withLetterSpacing(-2),
  titleLarge: const TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: 'Pretendard',
    fontSize: 22.0,
    height: 1.3333,
  ).withLetterSpacing(-2),
  titleMedium: const TextStyle(
    fontWeight: FontWeight.w500,
    fontFamily: 'Pretendard',
    fontSize: 16.0,
    height: 1.3333,
  ).withLetterSpacing(-2),
  titleSmall: const TextStyle(
    fontWeight: FontWeight.w500,
    fontFamily: 'Pretendard',
    fontSize: 14.0,
    height: 1.3333,
  ).withLetterSpacing(-2),
  labelLarge: const TextStyle(
    fontWeight: FontWeight.w500,
    fontFamily: 'Pretendard',
    fontSize: 14.0,
    height: 1.3333,
  ).withLetterSpacing(-2),
  labelMedium: const TextStyle(
    fontWeight: FontWeight.w500,
    fontFamily: 'Pretendard',
    fontSize: 12.0,
    height: 1.3333,
  ).withLetterSpacing(-2),
  labelSmall: const TextStyle(
    fontWeight: FontWeight.w500,
    fontFamily: 'Pretendard',
    fontSize: 11.0,
    height: 1.3333,
  ).withLetterSpacing(-2),
  bodyLarge: const TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: 'Pretendard',
    fontSize: 16.0,
    height: 1.3333,
  ).withLetterSpacing(-2),
  bodyMedium: const TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: 'Pretendard',
    fontSize: 14.0,
    height: 1.3333,
  ).withLetterSpacing(-2),
  bodySmall: const TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: 'Pretendard',
    fontSize: 12.0,
    height: 1.3333,
  ).withLetterSpacing(-2),
);

final ColorScheme schemeLight = SeedColorScheme.fromSeeds(
  brightness: Brightness.light,
  primaryKey: KeyColor.primary,
  primary: KeyColor.primary,
  tones: FlexTones.oneHue(
    Brightness.light,
  ).monochromeSurfaces().higherContrastFixed(),
);

final ColorScheme schemeDark = SeedColorScheme.fromSeeds(
  brightness: Brightness.dark,
  primaryKey: KeyColor.primary,
  primaryContainer: KeyColor.primary,
  tones: FlexTones.oneHue(
    Brightness.dark,
  ).monochromeSurfaces().higherContrastFixed(),
);

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  visualDensity: VisualDensity.compact,
  actionIconTheme: ActionIconThemeData(
    backButtonIconBuilder: (context) => Icon(Symbols.chevron_left_rounded),
  ),
  textTheme: textTheme,
  colorScheme: schemeLight,
  scaffoldBackgroundColor: schemeLight.surfaceContainerLow,
  dividerColor: schemeLight.outline.withValues(alpha: 0.2),
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
    backgroundColor: schemeLight.surfaceContainerLow,
    scrolledUnderElevation: 0.0,
  ),
  iconTheme: IconThemeData(
    weight: 400.0,
    opticalSize: 20.0,
    color: schemeLight.onSurface,
  ),
  inputDecorationTheme: InputDecorationTheme(
    isDense: true,
    fillColor: schemeLight.surfaceBright,
    contentPadding: EdgeInsets.fromLTRB(8.0, 14.0, 8.0, 8.0),
    errorStyle: const TextStyle(height: 0.0),
    floatingLabelBehavior: FloatingLabelBehavior.never,
    iconColor: schemeLight.onSurface.withValues(alpha: 0.7),
    prefixIconConstraints: const BoxConstraints(
      minWidth: 20.0,
      minHeight: 20.0,
    ),
    suffixIconConstraints: const BoxConstraints(
      minWidth: 20.0,
      minHeight: 20.0,
    ),
    labelStyle: TextStyle(textBaseline: TextBaseline.ideographic),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: schemeLight.outline.withValues(alpha: 0.2)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: schemeLight.outline.withValues(alpha: 0.2)),
    ),
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: ButtonStyle(
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      textStyle: WidgetStatePropertyAll(
        textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
      ),
      padding: WidgetStatePropertyAll(const EdgeInsets.all(16.0)),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      elevation: WidgetStateProperty.resolveWith<double?>((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.disabled)) {
          return 0.0;
        } else {
          return 1.0;
        }
      }),
      foregroundColor: WidgetStateProperty.resolveWith<Color?>((
        Set<WidgetState> states,
      ) {
        if (!states.contains(WidgetState.disabled)) {
          return schemeLight.onSurface.withValues(alpha: 0.7);
        }
        return null;
      }),
      backgroundColor: WidgetStateProperty.resolveWith<Color?>((
        Set<WidgetState> states,
      ) {
        if (!states.contains(WidgetState.disabled)) {
          return schemeLight.surfaceBright;
        }
        return null;
      }),
      iconColor: WidgetStateProperty.resolveWith<Color?>((
        Set<WidgetState> states,
      ) {
        if (!states.contains(WidgetState.disabled)) {
          return schemeLight.onSurface.withValues(alpha: 0.7);
        }
        return null;
      }),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(color: schemeLight.outline.withValues(alpha: 0.2)),
        ),
      ),
      padding: WidgetStatePropertyAll(const EdgeInsets.all(16.0)),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
  ),
  tabBarTheme: TabBarThemeData(
    dividerColor: schemeDark.outline.withValues(alpha: 0.2),
  ),
  dividerTheme: DividerThemeData(
    indent: 0.0,
    endIndent: 0.0,
    space: 1.0,
    color: schemeLight.outline.withValues(alpha: 0.2),
  ),
  dialogTheme: DialogThemeData(
    backgroundColor: schemeLight.surfaceBright,
    barrierColor: Colors.black26,
    insetPadding: const EdgeInsets.all(24.0),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: schemeLight.surfaceBright,
  ),
  dataTableTheme: DataTableThemeData(
    headingRowColor: WidgetStatePropertyAll(Colors.transparent),
    dividerThickness: 0,
    horizontalMargin: 24.0,
    columnSpacing: 0.0,
  ),
  tooltipTheme: TooltipThemeData(
    constraints: BoxConstraints(maxWidth: 300.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4.0),
      boxShadow: [
        BoxShadow(
          color: schemeLight.outline.withValues(alpha: 0.3),
          spreadRadius: 1,
          blurRadius: 3,
          offset: Offset(0, 1), // 그림자 위치
        ),
      ],
      color: schemeLight.surface,
    ),
    textStyle: TextStyle(color: schemeLight.onSurface),
    triggerMode: TooltipTriggerMode.tap,
  ),
  menuTheme: MenuThemeData(
    style: MenuStyle(
      backgroundColor: WidgetStatePropertyAll(schemeLight.surface),
    ),
  ),
  menuButtonTheme: MenuButtonThemeData(
    style: ButtonStyle(
      padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 8.0)),
      visualDensity: VisualDensity(horizontal: 0.0, vertical: -4.0),
    ),
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    strokeCap: StrokeCap.round,
    linearTrackColor: schemeLight.surfaceContainerHighest,
  ),
  splashFactory: InkSparkle.splashFactory,
  extensions: [
    SkeletonizerConfigData(
      effect: ShimmerEffect(
        baseColor: schemeLight.shadow.withValues(alpha: 0.05),
        highlightColor: schemeLight.shadow.withValues(alpha: 0.1),
        duration: Duration(seconds: 1),
      ),
    ),
  ],
);

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  applyElevationOverlayColor: true,
  visualDensity: VisualDensity.compact,
  actionIconTheme: ActionIconThemeData(
    backButtonIconBuilder: (context) => Icon(Symbols.chevron_left_rounded),
  ),
  textTheme: textTheme,
  colorScheme: schemeDark,
  scaffoldBackgroundColor: schemeDark.surfaceContainerLow,
  dividerColor: schemeDark.outline.withValues(alpha: 0.2),
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
    backgroundColor: schemeDark.surfaceContainerLow,
    scrolledUnderElevation: 0.0,
  ),
  iconTheme: IconThemeData(
    weight: 400.0,
    opticalSize: 20.0,
    color: schemeDark.onSurface,
  ),
  inputDecorationTheme: InputDecorationTheme(
    isDense: true,
    fillColor: schemeDark.surfaceBright,
    contentPadding: EdgeInsets.fromLTRB(8.0, 14.0, 8.0, 8.0),
    errorStyle: const TextStyle(height: 0.0),
    floatingLabelBehavior: FloatingLabelBehavior.never,
    iconColor: schemeDark.onSurface.withValues(alpha: 0.6),
    prefixIconConstraints: const BoxConstraints(
      minWidth: 19.0,
      minHeight: 19.0,
    ),
    suffixIconConstraints: const BoxConstraints(
      minWidth: 19.0,
      minHeight: 19.0,
    ),
    labelStyle: TextStyle(textBaseline: TextBaseline.ideographic),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: schemeDark.outline.withValues(alpha: 0.2)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: schemeDark.outline.withValues(alpha: 0.2)),
    ),
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: ButtonStyle(
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      textStyle: WidgetStatePropertyAll(
        textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
      ),
      padding: WidgetStatePropertyAll(const EdgeInsets.all(16.0)),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      elevation: WidgetStateProperty.resolveWith<double?>((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.disabled)) {
          return 0.0;
        } else {
          return 1.0;
        }
      }),
      foregroundColor: WidgetStateProperty.resolveWith<Color?>((
        Set<WidgetState> states,
      ) {
        if (!states.contains(WidgetState.disabled)) {
          return schemeDark.onSurface.withValues(alpha: 0.7);
        }
        return null;
      }),
      backgroundColor: WidgetStateProperty.resolveWith<Color?>((
        Set<WidgetState> states,
      ) {
        if (!states.contains(WidgetState.disabled)) {
          return schemeDark.surfaceBright;
        }
        return null;
      }),
      iconColor: WidgetStateProperty.resolveWith<Color?>((
        Set<WidgetState> states,
      ) {
        if (!states.contains(WidgetState.disabled)) {
          return schemeDark.onSurface.withValues(alpha: 0.7);
        }
        return null;
      }),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(color: schemeDark.outline.withValues(alpha: 0.2)),
        ),
      ),
      padding: WidgetStatePropertyAll(const EdgeInsets.all(16.0)),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
  ),
  tabBarTheme: TabBarThemeData(
    dividerColor: schemeDark.outline.withValues(alpha: 0.2),
  ),
  dividerTheme: DividerThemeData(
    indent: 0.0,
    endIndent: 0.0,
    space: 1.0,
    color: schemeDark.outline.withValues(alpha: 0.2),
  ),
  dialogTheme: DialogThemeData(
    backgroundColor: schemeDark.surfaceBright,
    barrierColor: Colors.black26,
    insetPadding: const EdgeInsets.all(24.0),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: schemeDark.surfaceBright,
  ),
  dataTableTheme: DataTableThemeData(
    headingRowColor: WidgetStatePropertyAll(Colors.transparent),
    dividerThickness: 0,
    horizontalMargin: 24.0,
    columnSpacing: 0.0,
  ),
  tooltipTheme: TooltipThemeData(
    constraints: BoxConstraints(maxWidth: 300.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16.0),
      color: schemeDark.surface,
    ),
    textStyle: TextStyle(color: schemeDark.onSurface),
    triggerMode: TooltipTriggerMode.tap,
  ),
  menuTheme: MenuThemeData(
    style: MenuStyle(
      backgroundColor: WidgetStatePropertyAll(schemeDark.surface),
    ),
  ),
  menuButtonTheme: MenuButtonThemeData(
    style: ButtonStyle(
      padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 8.0)),
      visualDensity: VisualDensity(horizontal: 0.0, vertical: -4.0),
    ),
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    strokeCap: StrokeCap.round,
    linearTrackColor: schemeDark.surfaceContainerHighest,
  ),
  splashFactory: InkSparkle.splashFactory,
  extensions: [
    SkeletonizerConfigData.dark(
      effect: ShimmerEffect(
        baseColor: schemeDark.shadow.withValues(alpha: 0.05),
        highlightColor: schemeDark.shadow.withValues(alpha: 0.1),
        duration: Duration(seconds: 1),
      ),
    ),
  ],
);
