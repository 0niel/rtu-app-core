import 'package:flutter/material.dart';
import 'package:rtu_app_core/rtu_app_core.dart';

abstract class NinjaInputThemes {
  // get context to find Brightness to implement light and dark themes
  static fullBorder(BuildContext context) => const InputDecorationTheme(
        fillColor: NinjaConstant.grey200,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 1, color: NinjaConstant.secondary300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 1, color: NinjaConstant.grey200),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 1, color: NinjaConstant.grey200),
        ),
      );

  // get context to find Brightness to implement light and dark themes
  static underlineBorder(BuildContext context) => const InputDecorationTheme(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: NinjaConstant.secondary300),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: NinjaConstant.grey300),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: NinjaConstant.grey300),
        ),
      );
}
