import 'package:flutter/material.dart';
import 'package:keiko_good_day/core/injection/di.dart';
import 'package:keiko_good_day/core/local_storage/shared_preferences.dart';
import 'package:keiko_good_day/core/utils/constant/key_constant.dart';
import 'package:keiko_good_day/presentation/theme/app_theme.dart';
import 'package:keiko_good_day/presentation/view/intro/intro_menu.dart';
import 'package:keiko_good_day/presentation/view/navigation/navigation.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final sharedPref = sl<SharedPrefs>();

  @override
  Widget build(BuildContext context) {
    final isLogin = sharedPref.isKeyExists(KeyConstant.keyAccessToken);
    return MaterialApp(
      theme: AppTheme.lightTheme,
      home: isLogin ? const Navigation() : const IntroMenu(),
    );
  }
}
