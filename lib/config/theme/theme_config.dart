import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:mywaiter_design/config/theme/palette.dart';
import 'package:mywaiter_design/config/theme/theme.dart';

class ThemeConfig {
  static ThemeData get light => theme(Palette.colorScheme);
  static ThemeData get dark => theme(Palette.darkColorScheme);

  static bool get isDarkMode => !isLightMode;
  static bool get isLightMode =>
      SchedulerBinding.instance!.window.platformBrightness == Brightness.light;

  static void setSystemBarsStyle({
    Color? statusBarColor,
    Brightness? statusBarBrightness,
    Brightness? statusBarIconBrightness,
    Color? systemNavigationBarColor,
    Brightness? systemNavigationBarIconBrightness,
    // bool? systemStatusBarContrastEnforced,
    // bool? systemNavigationBarContrastEnforced,
    // Color? systemNavigationBarDividerColor,
  }) =>
      SystemChrome.setSystemUIOverlayStyle(systemOverlayStyle.copyWith(
        statusBarColor: statusBarColor,
        statusBarBrightness: statusBarBrightness,
        statusBarIconBrightness: statusBarIconBrightness,
        systemNavigationBarColor: systemNavigationBarColor,
        systemNavigationBarIconBrightness: systemNavigationBarIconBrightness,
      ));

  static SystemUiOverlayStyle get systemOverlayStyle {
    final brightness = isLightMode ? Brightness.dark : Brightness.light;
    final color = isLightMode
        ? Palette.colorScheme.background
        : Palette.darkColorScheme.background;

    return SystemUiOverlayStyle(
      statusBarColor: color,
      statusBarBrightness: brightness,
      statusBarIconBrightness: brightness,
      systemNavigationBarColor: color,
      systemNavigationBarIconBrightness: brightness,
      // systemStatusBarContrastEnforced: ,
      // systemNavigationBarContrastEnforced: ,
      // systemNavigationBarDividerColor: ,
    );
  }
}
