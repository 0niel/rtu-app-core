import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_theme.dart';

enum TextType {
  h1,
  h2,
  h3,
  h4,
  h5,
  h6,
  bodyXLarge,
  bydyLarge,
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

  static Map<TextType, double> _defaultTextSize = {
    TextType.h1: 48,
    TextType.h2: 40,
    TextType.h3: 36,
    TextType.h4: 24,
    TextType.h5: 20,
    TextType.h6: 18,
    TextType.bodyXLarge: 18,
    TextType.bydyLarge: 16,
    TextType.bodyMedium: 14,
    TextType.bodySmall: 12,
    TextType.bodyXSmall: 10,
  };

  static Map<TextType, int> _defaultTextFontWeight = {
    TextType.h1: 700,
    TextType.h2: 700,
    TextType.h3: 700,
    TextType.h4: 600,
    TextType.h5: 700,
    TextType.h6: 700,
    TextType.bodyXLarge: 400,
    TextType.bydyLarge: 400,
    TextType.bodyMedium: 400,
    TextType.bodySmall: 400,
    TextType.bodyXSmall: 400,
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
    color ??= AppTheme.getThemeFromThemeMode().colorScheme.onBackground;

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
      fontSize: fontSize ?? _defaultTextSize[TextType.h1],
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
      fontSize: fontSize ?? _defaultTextSize[TextType.h2],
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
      fontSize: fontSize ?? _defaultTextSize[TextType.h3],
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
      fontSize: fontSize ?? _defaultTextSize[TextType.h4],
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
      fontSize: fontSize ?? _defaultTextSize[TextType.h5],
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
      fontSize: fontSize ?? _defaultTextSize[TextType.h6],
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
      fontSize: fontSize ?? _defaultTextSize[TextType.bodyXLarge],
      color: color,
      height: height,
      letterSpacing: letterSpacing ?? 0,
      fontWeight: fontWeight,
      decoration: decoration,
      wordSpacing: wordSpacing,
    );
  }

  static TextStyle bydyLarge({
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
      fontSize: fontSize ?? _defaultTextSize[TextType.bydyLarge],
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
      fontSize: fontSize ?? _defaultTextSize[TextType.bodyMedium],
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
      fontSize: fontSize ?? _defaultTextSize[TextType.bodySmall],
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
      fontSize: fontSize ?? _defaultTextSize[TextType.bodyXSmall],
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

  static void changeDefaultTextSize(Map<TextType, double> defaultTextSize) {
    NinjaTextStyle._defaultTextSize = defaultTextSize;
  }

  static Map<TextType, double> get defaultTextSize => _defaultTextSize;

  static Map<TextType, int> get defaultTextFontWeight => _defaultTextFontWeight;

  static Map<int, FontWeight> get defaultFontWeight => _defaultFontWeight;

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
      TextType.h1: 48,
      TextType.h2: 40,
      TextType.h3: 36,
      TextType.h4: 24,
      TextType.h5: 20,
      TextType.h6: 18,
      TextType.bodyXLarge: 18,
      TextType.bydyLarge: 16,
      TextType.bodyMedium: 14,
      TextType.bodySmall: 12,
      TextType.bodyXSmall: 10,
    };

    _defaultTextFontWeight = {
      TextType.h1: 700,
      TextType.h2: 700,
      TextType.h3: 700,
      TextType.h4: 600,
      TextType.h5: 700,
      TextType.h6: 700,
      TextType.bodyXLarge: 400,
      TextType.bydyLarge: 400,
      TextType.bodyMedium: 400,
      TextType.bodySmall: 400,
      TextType.bodyXSmall: 400,
    };
  }
}
