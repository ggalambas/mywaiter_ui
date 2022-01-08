import 'package:flutter/material.dart';
import 'package:mywaiter_design/config/theme/theme_config.dart';
import 'package:mywaiter_design/pages/home_page.dart';
import 'package:mywaiter_design/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    ThemeConfig.setSystemBarsStyle(context);
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed)
      ThemeConfig.setSystemBarsStyle(context);
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyWaiter Design',
      theme: ThemeConfig.light,
      darkTheme: ThemeConfig.dark,
      themeMode: ThemeMode.system,
      routes: {
        LoginPage.route: (_) => const LoginPage(),
        HomePage.route: (_) => const HomePage(),
      },
      home: const LoginPage(),
    );
  }
}
