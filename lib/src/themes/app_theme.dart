import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rtu_app_core/src/themes/text_style.dart';

import 'constant.dart';

enum NinjaThemeType { light, dark }

class NinjaAppTheme {
  static NinjaThemeType defaultThemeType = NinjaThemeType.light;

  static ThemeData theme = NinjaAppTheme.getThemeFromThemeMode();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    primaryColor: NinjaConstant.primary,
    scaffoldBackgroundColor: Colors.white,
    canvasColor: Colors.transparent,

    /// AppBar Theme
    appBarTheme: AppBarTheme(
      elevation: 0,
      shadowColor: const Color.fromRGBO(0, 0, 0, 0.13),
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
          color: const Color(0xFF232323),
          fontWeight: FontWeight.w500,
          fontSize: NinjaTextStyle.defaultTextSize[NinjaTextType.bodyMedium],
          fontFamily: NinjaTextStyle.fontFamily),
      iconTheme: const IconThemeData(color: Color(0xFF0F172A)),
      actionsIconTheme: const IconThemeData(color: Color(0xFF0F172A)),
    ),

    /// Card Theme
    cardTheme: const CardTheme(color: Color(0xfff0f0f0)),
    cardColor: const Color(0xfff0f0f0),

    /// Floating Action Theme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: const Color(0xff3C4EC5),
        splashColor: const Color(0xffeeeeee).withAlpha(100),
        highlightElevation: 8,
        elevation: 4,
        focusColor: const Color(0xff3C4EC5),
        hoverColor: const Color(0xff3C4EC5),
        foregroundColor: const Color(0xffeeeeee)),

    /// Divider Theme
    dividerTheme: const DividerThemeData(
      color: NinjaConstant.grey200,
      thickness: 0.0,
      space: 1,
    ),
    dividerColor: NinjaConstant.grey200,

    /// Bottom AppBar Theme
    bottomAppBarTheme:
        const BottomAppBarTheme(color: Color(0xffeeeeee), elevation: 2),

    /// Tab bar Theme
    tabBarTheme: const TabBarTheme(
      unselectedLabelColor: Color(0xff495057),
      labelColor: Color(0xff3d63ff),
      indicatorSize: TabBarIndicatorSize.label,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: Color(0xff3d63ff), width: 2.0),
      ),
    ),

    /// CheckBox theme
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(Colors.white),
      fillColor: MaterialStateProperty.all(NinjaConstant.secondary),
    ),

    /// Radio theme
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all(NinjaConstant.secondary),
    ),

    ///Switch Theme
    switchTheme: SwitchThemeData(
      trackColor: MaterialStateProperty.resolveWith((state) {
        const Set<MaterialState> interactiveStates = <MaterialState>{
          MaterialState.pressed,
          MaterialState.hovered,
          MaterialState.focused,
          MaterialState.selected,
        };
        if (state.any(interactiveStates.contains)) {
          return const Color(0xffabb3ea);
        }
        return null;
      }),
      thumbColor: MaterialStateProperty.resolveWith((state) {
        const Set<MaterialState> interactiveStates = <MaterialState>{
          MaterialState.pressed,
          MaterialState.hovered,
          MaterialState.focused,
          MaterialState.selected,
        };
        if (state.any(interactiveStates.contains)) {
          return const Color(0xff3C4EC5);
        }
        return null;
      }),
    ),

    /// Slider Theme
    sliderTheme: SliderThemeData(
      activeTrackColor: NinjaConstant.secondary,
      inactiveTrackColor: NinjaConstant.secondary200,
      trackShape: const RoundedRectSliderTrackShape(),
      trackHeight: 4.0,
      thumbColor: NinjaConstant.secondary,
      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10.0),
      overlayShape: const RoundSliderOverlayShape(overlayRadius: 24.0),
      tickMarkShape: const RoundSliderTickMarkShape(),
      inactiveTickMarkColor: Colors.red[100],
      valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
      valueIndicatorTextStyle: const TextStyle(
        color: Color(0xffeeeeee),
      ),
    ),

    /// Other Colors
    splashColor: Colors.white.withAlpha(100),
    indicatorColor: const Color(0xffeeeeee),
    highlightColor: const Color(0xffeeeeee),

    /// Input (Text-Field) Theme
    inputDecorationTheme: const InputDecorationTheme(
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
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: NinjaConstant.primary,
      onPrimary: NinjaConstant.primaryBlack,
      secondary: NinjaConstant.secondary,
      onSecondary: Colors.white,
      error: NinjaConstant.error,
      background: Colors.white,
      onBackground: NinjaConstant.primaryBlack,
      onError: Colors.white,
      onSurface: NinjaConstant.primaryBlack,
      surface: Colors.white,
    ).copyWith(background: Colors.white).copyWith(error: NinjaConstant.error),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,

    /// Brightness
    brightness: Brightness.dark,

    /// Primary Color
    primaryColor: const Color(0xff069DEF),

    /// Scaffold and Background color
    scaffoldBackgroundColor: const Color(0xff161616),
    canvasColor: Colors.transparent,

    /// AppBar Theme
    appBarTheme: const AppBarTheme(backgroundColor: Color(0xff161616)),

    /// Card Theme
    cardTheme: const CardTheme(color: Color(0xff222327)),
    cardColor: const Color(0xff222327),

    /// Input (Text-Field) Theme
    inputDecorationTheme: const InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(width: 1, color: Color(0xff069DEF)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(width: 1, color: Colors.white70),
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 1, color: Colors.white70)),
    ),

    /// Divider Color
    dividerTheme:
        const DividerThemeData(color: Color(0xff363636), thickness: 1),
    dividerColor: const Color(0xff363636),

    /// Floating Action Theme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: const Color(0xff069DEF),
        splashColor: Colors.white.withAlpha(100),
        highlightElevation: 8,
        elevation: 4,
        focusColor: const Color(0xff069DEF),
        hoverColor: const Color(0xff069DEF),
        foregroundColor: Colors.white),

    /// Bottom AppBar Theme
    bottomAppBarTheme:
        const BottomAppBarTheme(color: Color(0xff464c52), elevation: 2),

    /// Tab bar Theme
    tabBarTheme: const TabBarTheme(
      unselectedLabelColor: Color(0xff495057),
      labelColor: Color(0xff069DEF),
      indicatorSize: TabBarIndicatorSize.label,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: Color(0xff069DEF), width: 2.0),
      ),
    ),

    ///Switch Theme
    switchTheme: SwitchThemeData(
      trackColor: MaterialStateProperty.resolveWith((state) {
        const Set<MaterialState> interactiveStates = <MaterialState>{
          MaterialState.pressed,
          MaterialState.hovered,
          MaterialState.focused,
          MaterialState.selected,
        };
        if (state.any(interactiveStates.contains)) {
          return const Color(0xffabb3ea);
        }
        return null;
      }),
      thumbColor: MaterialStateProperty.resolveWith((state) {
        const Set<MaterialState> interactiveStates = <MaterialState>{
          MaterialState.pressed,
          MaterialState.hovered,
          MaterialState.focused,
          MaterialState.selected,
        };
        if (state.any(interactiveStates.contains)) {
          return const Color(0xff3C4EC5);
        }
        return null;
      }),
    ),

    /// Slider Theme
    sliderTheme: SliderThemeData(
      activeTrackColor: const Color(0xff069DEF),
      inactiveTrackColor: const Color(0xff069DEF).withAlpha(100),
      trackShape: const RoundedRectSliderTrackShape(),
      trackHeight: 4.0,
      thumbColor: const Color(0xff069DEF),
      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10.0),
      overlayShape: const RoundSliderOverlayShape(overlayRadius: 24.0),
      tickMarkShape: const RoundSliderTickMarkShape(),
      inactiveTickMarkColor: Colors.red[100],
      valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
      valueIndicatorTextStyle: const TextStyle(
        color: Colors.white,
      ),
    ),

    ///Other Color
    indicatorColor: Colors.white,
    disabledColor: const Color(0xffa3a3a3),
    highlightColor: Colors.white.withAlpha(28),
    splashColor: Colors.white.withAlpha(56),
    colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xff069DEF), brightness: Brightness.dark)
        .copyWith(background: const Color(0xff161616))
        .copyWith(error: Colors.orange),
  );

  static CupertinoThemeData cupertinoLightTheme = const CupertinoThemeData(
    brightness: Brightness.light,
    primaryColor: NinjaConstant.primary,
    primaryContrastingColor: NinjaConstant.secondary,
    scaffoldBackgroundColor: Colors.white,
  );

  static ThemeData getThemeFromThemeMode({NinjaThemeType? themeType}) {
    themeType ??= defaultThemeType;

    if (themeType == NinjaThemeType.light) {
      return lightTheme;
    }
    return darkTheme;
  }

  static void updateThemeData(NinjaThemeType themeType, ThemeData themeData) {
    if (themeType == NinjaThemeType.light) {
      lightTheme = themeData;
    } else {
      darkTheme = themeData;
    }
  }

  static void changeThemeType(NinjaThemeType? themeType) {
    defaultThemeType = themeType ?? NinjaThemeType.light;
    theme = NinjaAppTheme.getThemeFromThemeMode();
  }
}
