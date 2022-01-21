import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mywaiter_design/config/constants.dart';

ThemeData theme(ColorScheme colorScheme) => ThemeData(
      colorScheme: colorScheme,
      primaryColor: colorScheme.primary,
      backgroundColor: colorScheme.background,
      errorColor: colorScheme.error,
      scaffoldBackgroundColor: colorScheme.background,
      canvasColor: colorScheme.background,
      textTheme: GoogleFonts.poppinsTextTheme(),
      appBarTheme: _appBarTheme(colorScheme),
      scrollbarTheme: _scrollbarTheme(),
      inputDecorationTheme: _inputDecorationTheme(),
      bottomNavigationBarTheme: _bottomNavigationBarTheme(),
      elevatedButtonTheme: _elevatedButtonTheme(),
    );

ElevatedButtonThemeData _elevatedButtonTheme() => ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRadius),
        ),
        padding: EdgeInsets.symmetric(horizontal: 24),
        minimumSize: Size.fromHeight(56),
      ),
    );

BottomNavigationBarThemeData _bottomNavigationBarTheme() =>
    BottomNavigationBarThemeData(elevation: 0);

InputDecorationTheme _inputDecorationTheme() => InputDecorationTheme(
      filled: true,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
    );

AppBarTheme _appBarTheme(ColorScheme colorScheme) => AppBarTheme(elevation: 0);

ScrollbarThemeData _scrollbarTheme() => ScrollbarThemeData(
    // thumbColor: MaterialStateColor.resolveWith((states) {
    //   if (states.contains(MaterialState.dragged)) return Colors.black54;
    //   if (states.contains(MaterialState.hovered)) return Colors.black54;
    //   return Colors.black38;
    // }),
    );
