// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:keiko_good_day/presentation/view/navigation/navigation.dart';
import 'package:keiko_good_day/presentation/widget/input/app_text_field.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, this.isLoginAsMotoris = true}) : super(key: key);

  final bool isLoginAsMotoris;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assets/lottie_login.json'),
              const SizedBox(height: 30),
              Text('Selamat Datang',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.secondary)),
              Text(
                  'Masuk sebagai ${widget.isLoginAsMotoris ? 'Motoris' : 'Grosir'}',
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: Theme.of(context).colorScheme.secondary)),
              const SizedBox(height: 20),
              const AppTextField(
                  labelText: 'Username', hintText: 'Masukkan Username'),
              const AppTextField(
                  labelText: 'Password', hintText: 'Masukkan Password'),
              const SizedBox(height: 30),
              TextButton(
                  onPressed: () => Navigator.pushAndRemoveUntil<dynamic>(
                      context,
                      MaterialPageRoute<dynamic>(
                        builder: (context) => const Navigation(),
                      ),
                      (route) => false),
                  child: const Text('Login'))
            ],
          ),
        ),
      ),
    );
  }
}
