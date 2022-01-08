import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mywaiter_design/config/theme/palette.dart';
import 'package:mywaiter_design/config/theme/theme.dart';

class ThemeConfig {
  static ThemeData get light => theme(Palette.colorScheme);
  static ThemeData get dark => theme(Palette.darkColorScheme);

  static void setSystemBarsStyle(ThemeData theme) {
    final brightness = theme.brightness == Brightness.light
        ? Brightness.dark
        : Brightness.light;

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: brightness,
        statusBarIconBrightness: brightness,
        // systemStatusBarContrastEnforced: ,
        systemNavigationBarColor: theme.backgroundColor,
        systemNavigationBarIconBrightness: brightness,
        // systemNavigationBarDividerColor: ,
        // systemNavigationBarContrastEnforced: ,
      ),
    );
  }
}
