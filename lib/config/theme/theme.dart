import 'package:flutter/material.dart';

ThemeData theme(ColorScheme colorScheme) => ThemeData(
      colorScheme: colorScheme,
      primaryColor: colorScheme.primary,
      backgroundColor: colorScheme.background,
      errorColor: colorScheme.error,
      scaffoldBackgroundColor: colorScheme.background,
      canvasColor: colorScheme.background,
      appBarTheme: _appBarTheme(colorScheme),
      scrollbarTheme: _scrollbarTheme(),
      inputDecorationTheme: _inputDecorationTheme(),
      bottomNavigationBarTheme: _bottomNavigationBarTheme(),
    );

BottomNavigationBarThemeData _bottomNavigationBarTheme() =>
    BottomNavigationBarThemeData(elevation: 0);

InputDecorationTheme _inputDecorationTheme() => InputDecorationTheme(
      border: InputBorder.none,
    );

AppBarTheme _appBarTheme(ColorScheme colorScheme) => AppBarTheme(elevation: 0);

ScrollbarThemeData _scrollbarTheme() => ScrollbarThemeData(
    // thumbColor: MaterialStateColor.resolveWith((states) {
    //   if (states.contains(MaterialState.dragged)) return Colors.black54;
    //   if (states.contains(MaterialState.hovered)) return Colors.black54;
    //   return Colors.black38;
    // }),
    );
