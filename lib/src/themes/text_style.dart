import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_theme.dart';

enum NinjaTextType {
  h1,
  h2,
  h3,
  h4,
  h5,
  h6,
  bodyXLarge,
  bodyLarge,
  bodyMedium,
  bodySmall,
  bodyXSmall,
}

class NinjaTextStyle {
  static String _fontFamily = 'SF Pro Display';

  static Map<int, FontWeight> _defaultFontWeight = {
    100: FontWeight.w100,
    200: FontWeight.w200,
    300: FontWeight.w300,
    400: FontWeight.w400,
    500: FontWeight.w500,
    600: FontWeight.w600,
    700: FontWeight.w700,
    800: FontWeight.w800,
    900: FontWeight.w900,
  };

  static Map<NinjaTextType, double> _defaultTextSize = {
    NinjaTextType.h1: 48,
    NinjaTextType.h2: 40,
    NinjaTextType.h3: 36,
    NinjaTextType.h4: 24,
    NinjaTextType.h5: 20,
    NinjaTextType.h6: 18,
    NinjaTextType.bodyXLarge: 18,
    NinjaTextType.bodyLarge: 16,
    NinjaTextType.bodyMedium: 14,
    NinjaTextType.bodySmall: 12,
    NinjaTextType.bodyXSmall: 10,
  };

  static Map<NinjaTextType, int> _defaultTextFontWeight = {
    NinjaTextType.h1: 700,
    NinjaTextType.h2: 700,
    NinjaTextType.h3: 700,
    NinjaTextType.h4: 600,
    NinjaTextType.h5: 700,
    NinjaTextType.h6: 700,
    NinjaTextType.bodyXLarge: 400,
    NinjaTextType.bodyLarge: 400,
    NinjaTextType.bodyMedium: 400,
    NinjaTextType.bodySmall: 400,
    NinjaTextType.bodyXSmall: 400,
  };

  static TextStyle getStyle({
    TextStyle? otherTextStyle,
    int fontWeight = 400,
    double? letterSpacing,
    Color? color,
    TextDecoration decoration = TextDecoration.none,
    double? height,
    double wordSpacing = 0,
    double? fontSize,
  }) {
    color ??= NinjaAppTheme.theme.colorScheme.onBackground;

    if (otherTextStyle != null) {
      return otherTextStyle.copyWith(
          fontFamily: _fontFamily,
          fontSize: fontSize,
          fontWeight: _defaultFontWeight[fontWeight] ?? FontWeight.w400,
          letterSpacing: letterSpacing,
          color: color,
          decoration: decoration,
          height: height,
          wordSpacing: wordSpacing);
    }

    return TextStyle(
      fontFamily: _fontFamily,
      fontSize: fontSize,
      fontWeight: _defaultFontWeight[fontWeight] ?? FontWeight.w400,
      letterSpacing: letterSpacing,
      color: color,
      decoration: decoration,
      height: height,
      wordSpacing: wordSpacing,
    );
  }

  static TextStyle h1({
    TextStyle? otherTextStyle,
    int fontWeight = 700,
    double? letterSpacing,
    Color? color,
    TextDecoration decoration = TextDecoration.none,
    double? height,
    double wordSpacing = 0,
    double? fontSize,
  }) {
    return getStyle(
      otherTextStyle: otherTextStyle,
      fontSize: fontSize ?? _defaultTextSize[NinjaTextType.h1],
      color: color,
      height: height,
      letterSpacing: letterSpacing ?? 0,
      fontWeight: fontWeight,
      decoration: decoration,
      wordSpacing: wordSpacing,
    );
  }

  static TextStyle h2({
    TextStyle? otherTextStyle,
    int fontWeight = 700,
    double? letterSpacing,
    Color? color,
    TextDecoration decoration = TextDecoration.none,
    double? height,
    double wordSpacing = 0,
    double? fontSize,
  }) {
    return getStyle(
      otherTextStyle: otherTextStyle,
      fontSize: fontSize ?? _defaultTextSize[NinjaTextType.h2],
      color: color,
      height: height,
      letterSpacing: letterSpacing ?? 0,
      fontWeight: fontWeight,
      decoration: decoration,
      wordSpacing: wordSpacing,
    );
  }

  static TextStyle h3({
    TextStyle? otherTextStyle,
    int fontWeight = 700,
    double? letterSpacing,
    Color? color,
    TextDecoration decoration = TextDecoration.none,
    double? height,
    double wordSpacing = 0,
    double? fontSize,
  }) {
    return getStyle(
      otherTextStyle: otherTextStyle,
      fontSize: fontSize ?? _defaultTextSize[NinjaTextType.h3],
      color: color,
      height: height,
      letterSpacing: letterSpacing ?? 0,
      fontWeight: fontWeight,
      decoration: decoration,
      wordSpacing: wordSpacing,
    );
  }

  static TextStyle h4({
    TextStyle? otherTextStyle,
    int fontWeight = 600,
    double? letterSpacing,
    Color? color,
    TextDecoration decoration = TextDecoration.none,
    double? height,
    double wordSpacing = 0,
    double? fontSize,
  }) {
    return getStyle(
      otherTextStyle: otherTextStyle,
      fontSize: fontSize ?? _defaultTextSize[NinjaTextType.h4],
      color: color,
      height: height,
      letterSpacing: letterSpacing ?? 0,
      fontWeight: fontWeight,
      decoration: decoration,
      wordSpacing: wordSpacing,
    );
  }

  static TextStyle h5({
    TextStyle? otherTextStyle,
    int fontWeight = 700,
    double? letterSpacing,
    Color? color,
    TextDecoration decoration = TextDecoration.none,
    double? height,
    double wordSpacing = 0,
    double? fontSize,
  }) {
    return getStyle(
      otherTextStyle: otherTextStyle,
      fontSize: fontSize ?? _defaultTextSize[NinjaTextType.h5],
      color: color,
      height: height,
      letterSpacing: letterSpacing ?? 0,
      fontWeight: fontWeight,
      decoration: decoration,
      wordSpacing: wordSpacing,
    );
  }

  static TextStyle h6({
    TextStyle? otherTextStyle,
    int fontWeight = 700,
    double? letterSpacing,
    Color? color,
    TextDecoration decoration = TextDecoration.none,
    double? height,
    double wordSpacing = 0,
    double? fontSize,
  }) {
    return getStyle(
      otherTextStyle: otherTextStyle,
      fontSize: fontSize ?? _defaultTextSize[NinjaTextType.h6],
      color: color,
      height: height,
      letterSpacing: letterSpacing ?? 0,
      fontWeight: fontWeight,
      decoration: decoration,
      wordSpacing: wordSpacing,
    );
  }

  static TextStyle bodyXLarge({
    TextStyle? otherTextStyle,
    int fontWeight = 400,
    double? letterSpacing,
    Color? color,
    TextDecoration decoration = TextDecoration.none,
    double? height,
    double wordSpacing = 0,
    double? fontSize,
  }) {
    return getStyle(
      otherTextStyle: otherTextStyle,
      fontSize: fontSize ?? _defaultTextSize[NinjaTextType.bodyXLarge],
      color: color,
      height: height,
      letterSpacing: letterSpacing ?? 0,
      fontWeight: fontWeight,
      decoration: decoration,
      wordSpacing: wordSpacing,
    );
  }

  static TextStyle bodyLarge({
    TextStyle? otherTextStyle,
    int fontWeight = 400,
    double? letterSpacing,
    Color? color,
    TextDecoration decoration = TextDecoration.none,
    double? height,
    double wordSpacing = 0,
    double? fontSize,
  }) {
    return getStyle(
      otherTextStyle: otherTextStyle,
      fontSize: fontSize ?? _defaultTextSize[NinjaTextType.bodyLarge],
      color: color,
      height: height,
      letterSpacing: letterSpacing ?? 0,
      fontWeight: fontWeight,
      decoration: decoration,
      wordSpacing: wordSpacing,
    );
  }

  static TextStyle bodyMedium({
    TextStyle? otherTextStyle,
    int fontWeight = 400,
    double? letterSpacing,
    Color? color,
    TextDecoration decoration = TextDecoration.none,
    double? height,
    double wordSpacing = 0,
    double? fontSize,
  }) {
    return getStyle(
      otherTextStyle: otherTextStyle,
      fontSize: fontSize ?? _defaultTextSize[NinjaTextType.bodyMedium],
      color: color,
      height: height,
      letterSpacing: letterSpacing ?? 0,
      fontWeight: fontWeight,
      decoration: decoration,
      wordSpacing: wordSpacing,
    );
  }

  static TextStyle bodySmall({
    TextStyle? otherTextStyle,
    int fontWeight = 400,
    double? letterSpacing,
    Color? color,
    TextDecoration decoration = TextDecoration.none,
    double? height,
    double wordSpacing = 0,
    double? fontSize,
  }) {
    return getStyle(
      otherTextStyle: otherTextStyle,
      fontSize: fontSize ?? _defaultTextSize[NinjaTextType.bodySmall],
      color: color,
      height: height,
      letterSpacing: letterSpacing ?? 0.1,
      fontWeight: fontWeight,
      decoration: decoration,
      wordSpacing: wordSpacing,
    );
  }

  static TextStyle bodyXSmall({
    TextStyle? otherTextStyle,
    int fontWeight = 400,
    double? letterSpacing,
    Color? color,
    TextDecoration decoration = TextDecoration.none,
    double? height,
    double wordSpacing = 0,
    double? fontSize,
  }) {
    return getStyle(
      otherTextStyle: otherTextStyle,
      fontSize: fontSize ?? _defaultTextSize[NinjaTextType.bodyXSmall],
      color: color,
      height: height,
      letterSpacing: letterSpacing ?? 0,
      fontWeight: fontWeight,
      decoration: decoration,
      wordSpacing: wordSpacing,
    );
  }

  static void changeFontFamily(String fontFamily) {
    NinjaTextStyle._fontFamily = fontFamily;
  }

  static void changeDefaultFontWeight(Map<int, FontWeight> defaultFontWeight) {
    NinjaTextStyle._defaultFontWeight = defaultFontWeight;
  }

  static void changeDefaultTextSize(
      Map<NinjaTextType, double> defaultTextSize) {
    NinjaTextStyle._defaultTextSize = defaultTextSize;
  }

  static Map<NinjaTextType, double> get defaultTextSize => _defaultTextSize;

  static Map<NinjaTextType, int> get defaultTextFontWeight =>
      _defaultTextFontWeight;

  static Map<int, FontWeight> get defaultFontWeight => _defaultFontWeight;

  static String get fontFamily => _fontFamily;

  static resetFontStyles() {
    _fontFamily = 'SF Pro Display';

    _defaultFontWeight = {
      100: FontWeight.w100,
      200: FontWeight.w200,
      300: FontWeight.w300,
      400: FontWeight.w400,
      500: FontWeight.w500,
      600: FontWeight.w600,
      700: FontWeight.w700,
      800: FontWeight.w800,
      900: FontWeight.w900,
    };

    _defaultTextSize = {
      NinjaTextType.h1: 48,
      NinjaTextType.h2: 40,
      NinjaTextType.h3: 36,
      NinjaTextType.h4: 24,
      NinjaTextType.h5: 20,
      NinjaTextType.h6: 18,
      NinjaTextType.bodyXLarge: 18,
      NinjaTextType.bodyLarge: 16,
      NinjaTextType.bodyMedium: 14,
      NinjaTextType.bodySmall: 12,
      NinjaTextType.bodyXSmall: 10,
    };

    _defaultTextFontWeight = {
      NinjaTextType.h1: 700,
      NinjaTextType.h2: 700,
      NinjaTextType.h3: 700,
      NinjaTextType.h4: 600,
      NinjaTextType.h5: 700,
      NinjaTextType.h6: 700,
      NinjaTextType.bodyXLarge: 400,
      NinjaTextType.bodyLarge: 400,
      NinjaTextType.bodyMedium: 400,
      NinjaTextType.bodySmall: 400,
      NinjaTextType.bodyXSmall: 400,
    };
  }
}
