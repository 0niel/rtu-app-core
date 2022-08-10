/// Implementation of Text Widgets.
/// h1, h2, h3, h4, h5, h6, bodyXLarge, bodyLarge, bodyMedium, bodySmall, bodyXSmall.
import 'package:flutter/material.dart';

import '../../themes/themes.dart';

class NinjaText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final int? fontWeight;
  final double? letterSpacing;
  final Color? color;
  final TextDecoration decoration;
  final double? height;
  final double wordSpacing;
  final double? fontSize;
  final NinjaTextType textType;

  //Text Style
  final TextAlign? textAlign;
  final int? maxLines;
  final Locale? locale;
  final TextOverflow? overflow;
  final String? semanticsLabel;
  final bool? softWrap;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final TextHeightBehavior? textHeightBehavior;
  final double? textScaleFactor;
  final TextWidthBasis? textWidthBasis;

  const NinjaText(
    this.text, {
    Key? key,
    this.style,
    this.fontWeight = 400,
    this.letterSpacing,
    this.color,
    this.decoration = TextDecoration.none,
    this.height,
    this.wordSpacing = 0,
    this.fontSize,
    this.textType = NinjaTextType.bodyLarge,
    this.textAlign,
    this.maxLines,
    this.locale,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  }) : super(key: key);

  const NinjaText.h1(
    this.text, {
    Key? key,
    this.style,
    this.fontWeight,
    this.letterSpacing,
    this.color,
    this.decoration = TextDecoration.none,
    this.height,
    this.wordSpacing = 0,
    this.fontSize,
    this.textType = NinjaTextType.h1,
    this.textAlign,
    this.maxLines,
    this.locale,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  }) : super(key: key);

  const NinjaText.h2(
    this.text, {
    Key? key,
    this.style,
    this.fontWeight,
    this.letterSpacing,
    this.color,
    this.decoration = TextDecoration.none,
    this.height,
    this.wordSpacing = 0,
    this.fontSize,
    this.textType = NinjaTextType.h2,
    this.textAlign,
    this.maxLines,
    this.locale,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  }) : super(key: key);

  const NinjaText.h3(
    this.text, {
    Key? key,
    this.style,
    this.fontWeight,
    this.letterSpacing,
    this.color,
    this.decoration = TextDecoration.none,
    this.height,
    this.wordSpacing = 0,
    this.fontSize,
    this.textType = NinjaTextType.h3,
    this.textAlign,
    this.maxLines,
    this.locale,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  }) : super(key: key);

  const NinjaText.h4(
    this.text, {
    Key? key,
    this.style,
    this.fontWeight,
    this.letterSpacing,
    this.color,
    this.decoration = TextDecoration.none,
    this.height,
    this.wordSpacing = 0,
    this.fontSize,
    this.textType = NinjaTextType.h4,
    this.textAlign,
    this.maxLines,
    this.locale,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  }) : super(key: key);

  const NinjaText.h5(
    this.text, {
    Key? key,
    this.style,
    this.fontWeight,
    this.letterSpacing,
    this.color,
    this.decoration = TextDecoration.none,
    this.height,
    this.wordSpacing = 0,
    this.fontSize,
    this.textType = NinjaTextType.h5,
    this.textAlign,
    this.maxLines,
    this.locale,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  }) : super(key: key);

  const NinjaText.h6(
    this.text, {
    Key? key,
    this.style,
    this.fontWeight,
    this.letterSpacing,
    this.color,
    this.decoration = TextDecoration.none,
    this.height,
    this.wordSpacing = 0,
    this.fontSize,
    this.textType = NinjaTextType.h6,
    this.textAlign,
    this.maxLines,
    this.locale,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  }) : super(key: key);

  const NinjaText.bodyXLarge(
    this.text, {
    Key? key,
    this.style,
    this.fontWeight,
    this.letterSpacing,
    this.color,
    this.decoration = TextDecoration.none,
    this.height,
    this.wordSpacing = 0,
    this.fontSize,
    this.textType = NinjaTextType.bodyXLarge,
    this.textAlign,
    this.maxLines,
    this.locale,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  }) : super(key: key);

  const NinjaText.bodyLarge(
    this.text, {
    Key? key,
    this.style,
    this.fontWeight,
    this.letterSpacing,
    this.color,
    this.decoration = TextDecoration.none,
    this.height,
    this.wordSpacing = 0,
    this.fontSize,
    this.textType = NinjaTextType.bodyLarge,
    this.textAlign,
    this.maxLines,
    this.locale,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  }) : super(key: key);

  const NinjaText.bodyMedium(
    this.text, {
    Key? key,
    this.style,
    this.fontWeight,
    this.letterSpacing,
    this.color,
    this.decoration = TextDecoration.none,
    this.height,
    this.wordSpacing = 0,
    this.fontSize,
    this.textType = NinjaTextType.bodyMedium,
    this.textAlign,
    this.maxLines,
    this.locale,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  }) : super(key: key);

  const NinjaText.bodySmall(
    this.text, {
    Key? key,
    this.style,
    this.fontWeight,
    this.letterSpacing = 0.1,
    this.color,
    this.decoration = TextDecoration.none,
    this.height,
    this.wordSpacing = 0,
    this.fontSize,
    this.textType = NinjaTextType.bodySmall,
    this.textAlign,
    this.maxLines,
    this.locale,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  }) : super(key: key);

  const NinjaText.bodyXSmall(
    this.text, {
    Key? key,
    this.style,
    this.fontWeight,
    this.letterSpacing,
    this.color,
    this.decoration = TextDecoration.none,
    this.height,
    this.wordSpacing = 0,
    this.fontSize,
    this.textType = NinjaTextType.bodyXSmall,
    this.textAlign,
    this.maxLines,
    this.locale,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ??
          NinjaTextStyle.getStyle(
            otherTextStyle: style,
            color: color,
            fontWeight: fontWeight ??
                NinjaTextStyle.defaultTextFontWeight[textType] ??
                400,
            letterSpacing: letterSpacing,
            height: height,
            decoration: decoration,
            wordSpacing: wordSpacing,
            fontSize: fontSize ?? NinjaTextStyle.defaultTextSize[textType],
          ),
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection ?? TextDirection.ltr,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      key: key,
    );
  }
}
