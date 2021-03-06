import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mywaiter_design/config/constants.dart';
import 'package:mywaiter_design/config/theme/theme_config.dart';

ThemeData theme(ColorScheme colorScheme) => ThemeData(
      colorScheme: colorScheme,
      primaryColor: colorScheme.primary,
      backgroundColor: colorScheme.background,
      errorColor: colorScheme.error,
      scaffoldBackgroundColor: colorScheme.background,
      canvasColor: colorScheme.background,
      primaryTextTheme: _textTheme(colorScheme),
      textTheme: _textTheme(colorScheme),
      appBarTheme: _appBarTheme(colorScheme),
      bottomNavigationBarTheme: _bottomNavigationBarTheme(colorScheme),
      scrollbarTheme: _scrollbarTheme(),
      inputDecorationTheme: _inputDecorationTheme(colorScheme),
      elevatedButtonTheme: _elevatedButtonTheme(),
      iconTheme: _iconTheme(colorScheme),
    );

IconThemeData _iconTheme(ColorScheme colorScheme) => IconThemeData(
      color: colorScheme.onBackground,
    );

InputDecorationTheme _inputDecorationTheme(ColorScheme colorScheme) =>
    InputDecorationTheme(
      filled: true,
      fillColor: colorScheme.surface,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 24,
        vertical: (kButtonHeight - 16) / 2,
      ),
      hintStyle: TextStyle(color: colorScheme.onSurface),
      iconColor: colorScheme.onSurface,
    );

ElevatedButtonThemeData _elevatedButtonTheme() => ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRadius),
        ),
        padding: EdgeInsets.symmetric(horizontal: 24),
        minimumSize: Size.fromHeight(kButtonHeight),
      ),
    );

AppBarTheme _appBarTheme(ColorScheme colorScheme) => AppBarTheme(
      systemOverlayStyle: ThemeConfig.systemOverlayStyle,
      elevation: 0,
      backgroundColor: colorScheme.background,
      foregroundColor: colorScheme.onBackground,
    );

BottomNavigationBarThemeData _bottomNavigationBarTheme(
        ColorScheme colorScheme) =>
    BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: colorScheme.background,
      selectedItemColor: colorScheme.onBackground,
      unselectedItemColor: colorScheme.onSurface,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );

ScrollbarThemeData _scrollbarTheme() => ScrollbarThemeData(
    // thumbColor: MaterialStateColor.resolveWith((states) {
    //   if (states.contains(MaterialState.dragged)) return Colors.black54;
    //   if (states.contains(MaterialState.hovered)) return Colors.black54;
    //   return Colors.black38;
    // }),
    );

TextTheme _textTheme(ColorScheme colorScheme) => GoogleFonts.poppinsTextTheme(
      TextTheme(
        headline4: TextStyle(
          color: colorScheme.onBackground,
          fontSize: 34,
          height: 1.2,
        ),
        headline6: TextStyle(
          color: colorScheme.onBackground,
          fontSize: 20,
          height: 1.2,
        ),
        subtitle1: TextStyle(
          color: colorScheme.onBackground,
          fontSize: 14,
          height: 1,
        ),
        bodyText1: TextStyle(
          color: colorScheme.onBackground,
          fontSize: 16,
          height: 1,
        ),
        bodyText2: TextStyle(
          color: colorScheme.onBackground,
          fontSize: 14,
          height: 1,
        ),
        caption: TextStyle(
          color: colorScheme.onSurface,
          fontSize: 12,
          height: 1,
        ),
        button: TextStyle(
          fontSize: 14,
          height: 1,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
