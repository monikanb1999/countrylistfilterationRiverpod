import 'package:flutter/material.dart';

class ColorManager {
  ColorManager._();
  static const Color transparent = Colors.transparent;
  static const Color black = Colors.black;

  static const Color primary = Color(0xFF19a9e5);
  static const Color primary20 = Color(0xFF46baeb);
  static const Color primaryBackground = Color(0xFFecf7fd);

  static const Color offWhite = Color(0xFFefefef);

  static const Color lightGray = Color(0xffF0F2F5);
  static const Color darkGray = Color(0xffBDBDBD);

  static const Color textDark = Color(0xff121417);
  static const Color textLight = Color(0xff637587);
  static const Color textGray = Color(0xff6c6e71);
  static const Color textDarkGrey = Color(0xc1000000);

  static const Color white = Colors.white;
  static Color white05 = Colors.white.withOpacity(0.5);

  static const Color grey = Colors.grey;
  static const Color grey400 = Color(0xFFE0E0E0);

  static const Color red = Color(0xffFF3A30);

  static const Color blackBlur = Colors.black54;

  // Vitals
  static const Color vitalLow = Color(0xfffdc135);
  static const Color vitalNormal = Color(0xff7ac744);
  static const Color vitalAcceptable = Color(0xffFE712C);
  static const Color vitalHigh = Color(0xffBA1616);

  static const Color vitalGridColor = Color(0xffff479f);

  // IHL score
  static const Color ihlExcellent = Color(0xff193498);
  static const Color ihlVeryGood = Color(0xff113CFC);
  static const Color ihlGood = Color(0xff1597E5);
  static const Color ihlAverage = Color(0xff69DADB);

  static final List<Color> splashGradient = [
    primary,
    primary20,
    white05,
  ];

  static final BoxShadow shadow1 = BoxShadow(
    color: Colors.grey.withOpacity(0.5),
    spreadRadius: 1,
    blurRadius: 5,
  );

  static Color getShade(Color color, {bool darker = false, double value = .1}) {
    assert(value >= 0 && value <= 1, 'shade values must be between 0 and 1');

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness(
      (darker ? (hsl.lightness - value) : (hsl.lightness + value))
          .clamp(0.0, 1.0),
    );

    return hslDark.toColor();
  }
}

extension SuiizColors on Color {
  /// Returns a [MaterialColor] from a [Color] object
  MaterialColor getMaterialColorFromColor() {
    final colorShades = <int, Color>{
      50: ColorManager.getShade(this, value: 0.5),
      100: ColorManager.getShade(this, value: 0.4),
      200: ColorManager.getShade(this, value: 0.3),
      300: ColorManager.getShade(this, value: 0.2),
      400: ColorManager.getShade(this),
      500: this, //Primary value
      600: ColorManager.getShade(this, darker: true),
      700: ColorManager.getShade(this, value: 0.15, darker: true),
      800: ColorManager.getShade(this, value: 0.2, darker: true),
      900: ColorManager.getShade(this, value: 0.25, darker: true),
    };
    return MaterialColor(value, colorShades);
  }
}
