import 'package:flutter/material.dart';

class CColors{


   static Color bgColor = Color(0xFF110C16);
   static Color bgTF = Color(0xFF0D0910);
   static Color textColor = Color(0xFF92959D);
   static Color buttonOne = Color(0xFFFD6E00);
   static Color buttonTwo = Color(0xFFFA5500);
   static Color dHeader = Color(0xFF59599c);
   static Color bgColorTwo = Color(0xFF2A253E);
   static Color bgColorThree = Color(0xFF597ade);
   static Color IconColor = Color(0xFFC7C7D4);
   static Color containerCol = Color(0xFF003366);




  static Map<int, Color> getSwatch(Color color) {
    final hslColor = HSLColor.fromColor(color);
    final lightness = hslColor.lightness;
    const lowDivisor = 6;
    const highDivisor = 5;
    final lowStep = (1.0 - lightness) / lowDivisor;
    final highStep = lightness / highDivisor;
    return {
      50: (hslColor.withLightness(lightness + (lowStep * 5))).toColor(),
      100: (hslColor.withLightness(lightness + (lowStep * 4))).toColor(),
      200: (hslColor.withLightness(lightness + (lowStep * 3))).toColor(),
      300: (hslColor.withLightness(lightness + (lowStep * 2))).toColor(),
      400: (hslColor.withLightness(lightness + lowStep)).toColor(),
      500: (hslColor.withLightness(lightness)).toColor(),
      600: (hslColor.withLightness(lightness - highStep)).toColor(),
      700: (hslColor.withLightness(lightness - (highStep * 2))).toColor(),
      800: (hslColor.withLightness(lightness - (highStep * 3))).toColor(),
      900: (hslColor.withLightness(lightness - (highStep * 4))).toColor(),
    };
  }
}