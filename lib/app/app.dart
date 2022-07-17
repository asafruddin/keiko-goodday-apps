import 'package:flutter/material.dart';
import 'package:keiko_good_day/presentation/theme/app_theme.dart';
import 'package:keiko_good_day/presentation/view/intro/intro_menu.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      home: const IntroMenu(),
    );
  }
}
