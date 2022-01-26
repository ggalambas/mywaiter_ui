import 'package:flutter/material.dart';

class Palette {
  static const Color green = Color(0xFF2CB67D);
  static const Color red = Color(0xFFE45858);

  static const ColorScheme colorScheme = ColorScheme.light(
    primary: Color(0xFF6246EA),
    secondary: Color(0xFFEFEFEF),
    surface: Color(0xFFEFEFEF),
    background: Colors.white,
    error: red,
    //
    onPrimary: Colors.white,
    // onSecondary: Colors.white,
    onSurface: Color(0xFF8D8D91),
    onBackground: Color(0xFF2B2C34),
    onError: Colors.white,
  );

  static const ColorScheme darkColorScheme = ColorScheme.dark(
    primary: Color(0xFF7F5AF0),
    secondary: Color(0xFF242629),
    surface: Color(0xFF242629),
    background: Color(0xFF16161A),
    error: red,
    //
    onPrimary: Colors.white,
    // onSecondary: Colors.white,
    onSurface: Color(0xFF94A1B2),
    onBackground: Colors.white,
    onError: Colors.white,
  );
}
