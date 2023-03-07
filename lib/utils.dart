import 'dart:ui';
import 'package:flutter/material.dart';

class ColorUtils {
  static Color hexColor(String hexString,{Color defaultColor = const Color.fromARGB(1, 1, 1, 0)}) {
    if (hexString.length != 7 ||
        int.tryParse(hexString.substring(1, 7), radix: 16) == null) {
      return defaultColor;
    }
    var parse = int.parse(hexString.substring(1, 7), radix: 16);
    var hexColor = Color(parse + 0xFF000000);
    return hexColor;
  }
}