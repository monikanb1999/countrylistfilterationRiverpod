import 'dart:math';

import 'package:flutter/material.dart';

class ScreenSize {
  ScreenSize._();

  static double getWidth(BuildContext context, double percentage) {
    return MediaQuery.of(context).size.width * percentage / 100;
  }

  static double getHeight(BuildContext context, double percentage) {
    return MediaQuery.of(context).size.height * percentage / 100;
  }

  static double getFont(BuildContext context, double percentage) {
    final size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;
    final double shortDimension = width < height ? width : height;
    final double tempLongDimension = (16 / 9) * shortDimension;
    return sqrt(pow(tempLongDimension, 2) + pow(shortDimension, 2)) *
        (percentage / 100);
  }
}
