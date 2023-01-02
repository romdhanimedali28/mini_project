import 'package:flutter/material.dart';

class ColorManager {
  static Color puregold = HexColor.fromHex("#E5B80B"); //gold pure
  static Color mettalicgold = HexColor.fromHex("#D4AF37"); //gold mettalic
  static Color ingotgold = HexColor.fromHex("#F6CF0C"); //gold ingot
  static Color fortunagold = HexColor.fromHex("#DAA520"); //gold fortuna
  static Color blackgold = HexColor.fromHex("#281C02"); //black gold
  static Color nordgold = HexColor.fromHex("#D8A016"); //nord gold
  static Color richblack = HexColor.fromHex("#040404"); //rich gold
  static Color blackgrey = HexColor.fromHex("#2B2928"); //black grey
  static Color goldorange = HexColor.fromHex("#9F6B08"); //gold orange
}

extension HexColor on Color {
  static Color fromHex(String hexString) {
    hexString = hexString.replaceAll('#', '');
    if (hexString.length == 6) {
      hexString = 'FF$hexString';
    }
    return Color(int.parse(hexString, radix: 16));
  }
}
