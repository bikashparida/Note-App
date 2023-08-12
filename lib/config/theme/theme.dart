import 'package:flutter/material.dart';

class CustomTheme {
  static Color get appColor => const Color.fromARGB(255, 74, 2, 126);

  static Color get purple => Colors.purple;

  static Color get seedColor => const Color(0xFF000633);

  static Color get white => Colors.white;

  static Color get black => Colors.black;

  static Color get lightGreen => const Color.fromARGB(255, 124, 215, 91);

  static Color get maleficenceGrey => const Color(0xFF6C6C6C);

  static Color get red => const Color(0xFFFF3636);

  static Color get darkGray => const Color(0xFF646464);

  static Color get lightGray => const Color.fromARGB(255, 123, 122, 122);

  static TextStyle get labelRegular => TextStyle(
        fontSize: 16,
        color: CustomTheme.black,
        fontWeight: FontWeight.w400,
      );
}
