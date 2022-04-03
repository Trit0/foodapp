import 'package:flutter/material.dart';

//Yoinked from https://medium.com/@filipvk/creating-a-custom-color-swatch-in-flutter-554bcdcb27f3
MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  final swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }

  return MaterialColor(color.value, swatch);
}

class ColorUtil {
  static const Color primary = Colors.blue;

  static Color darken(Color color, double pourcentage) {
    return Color.lerp(color, Colors.black, pourcentage) ?? color;
  }

  static Color darkenInt(Color color, int pourcentage) {
    return Color.lerp(color, Colors.black, pourcentage / 100) ?? color;
  }

  static Color lighten(Color color, double pourcentage) {
    return Color.lerp(color, Colors.white, pourcentage) ?? color;
  }

  static Color lightenInt(Color color, int pourcentage) {
    return Color.lerp(color, Colors.white, pourcentage / 100) ?? color;
  }
}
