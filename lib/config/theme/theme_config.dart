import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:mywaiter_design/config/theme/palette.dart';
import 'package:mywaiter_design/config/theme/theme.dart';

class ThemeConfig {
  static ThemeData get light => theme(Palette.colorScheme);
  static ThemeData get dark => theme(Palette.darkColorScheme);

  static void setSystemBarsStyle() {
    final isLightMode = SchedulerBinding.instance!.window.platformBrightness ==
        Brightness.light;
    final brightness = isLightMode ? Brightness.dark : Brightness.light;
    final color = isLightMode
        ? Palette.colorScheme.background
        : Palette.darkColorScheme.background;

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: color,
        statusBarBrightness: brightness,
        statusBarIconBrightness: brightness,
        systemNavigationBarColor: color,
        systemNavigationBarIconBrightness: brightness,
        // systemStatusBarContrastEnforced: ,
        // systemNavigationBarContrastEnforced: ,
        // systemNavigationBarDividerColor: ,
      ),
    );
  }
}
