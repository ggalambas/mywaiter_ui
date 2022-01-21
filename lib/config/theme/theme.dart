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
      textTheme: _textTheme(colorScheme),
      appBarTheme: _appBarTheme(colorScheme),
      scrollbarTheme: _scrollbarTheme(),
      inputDecorationTheme: _inputDecorationTheme(colorScheme),
      bottomNavigationBarTheme: _bottomNavigationBarTheme(),
      elevatedButtonTheme: _elevatedButtonTheme(),
    );

BottomNavigationBarThemeData _bottomNavigationBarTheme() =>
    BottomNavigationBarThemeData(elevation: 0);

InputDecorationTheme _inputDecorationTheme(ColorScheme colorScheme) =>
    InputDecorationTheme(
      filled: true,
      fillColor: colorScheme.surface,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      hintStyle: TextStyle(color: colorScheme.onSurface),
      iconColor: colorScheme.onSurface,
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

AppBarTheme _appBarTheme(ColorScheme colorScheme) => AppBarTheme(elevation: 0);

ScrollbarThemeData _scrollbarTheme() => ScrollbarThemeData(
    // thumbColor: MaterialStateColor.resolveWith((states) {
    //   if (states.contains(MaterialState.dragged)) return Colors.black54;
    //   if (states.contains(MaterialState.hovered)) return Colors.black54;
    //   return Colors.black38;
    // }),
    );

TextTheme _textTheme(ColorScheme colorScheme) => GoogleFonts.poppinsTextTheme(
      TextTheme(
        // color: Colors.green,
        subtitle1: TextStyle(
          color: colorScheme.onBackground,
          fontSize: 14,
        ),
        bodyText1: TextStyle(
          color: Colors.green, //!
          // color: colorScheme.onBackground,
          fontSize: 16,
        ),
        bodyText2: TextStyle(
          color: colorScheme.onBackground,
          fontSize: 14,
        ),
        caption: TextStyle(
          color: colorScheme.onSurface,
          fontSize: 12,
        ),
        button: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
