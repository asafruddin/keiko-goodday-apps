// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keiko_good_day/core/exceptions/failure.dart';
import 'package:keiko_good_day/core/injection/di.dart';
import 'package:keiko_good_day/data/model/request/auth/login_body.dart';
import 'package:keiko_good_day/presentation/bloc/login/login_bloc.dart';
import 'package:keiko_good_day/presentation/view/navigation/navigation.dart';
import 'package:keiko_good_day/presentation/widget/input/app_text_field.dart';
import 'package:keiko_good_day/presentation/widget/loader/loader_overlay.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, this.isLoginAsMotoris = true}) : super(key: key);

  final bool isLoginAsMotoris;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginBloc = sl<LoginBloc>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => loginBloc,
      child: BlocListener<LoginBloc, LoginState>(
        listenWhen: (p, c) => p.isLogingIn != c.isLogingIn,
        listener: (context, state) {
          if (state.isLoginSuccess!) {
            Navigator.pushAndRemoveUntil<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                    builder: (context) => const Navigation()),
                (route) => false);
          } else {
            if (state.failure != null) {
              final snackBar = SnackBar(
                  duration: const Duration(milliseconds: 1500),
                  width: size.width - 50,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(16),
                  content: Text(state.failure?.message?.toString() ??
                      'Something Went Wrong'));

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          }
        },
        child: Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset('assets/lottie_login.json'),
                      const SizedBox(height: 30),
                      Text('Selamat Datang',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(
                                  fontWeight: FontWeight.w600,
                                  color:
                                      Theme.of(context).colorScheme.secondary)),
                      Text(
                          'Masuk sebagai ${widget.isLoginAsMotoris ? 'Motoris' : 'Grosir'}',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.secondary)),
                      const SizedBox(height: 20),
                      AppTextField(
                          controller: usernameController,
                          labelText: 'Username',
                          hintText: 'Masukkan Username'),
                      AppTextField(
                          controller: passwordController,
                          labelText: 'Password',
                          hintText: 'Masukkan Password'),
                      const SizedBox(height: 30),
                      TextButton(onPressed: onLogin, child: const Text('Login'))
                    ],
                  ),
                ),
              ),
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  if (state.isLogingIn ?? false) {
                    return const LoaderOverlay();
                  } else {
                    return const SizedBox();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void onLogin() {
    loginBloc.add(OnloginEvent(LoginBody(
        username: usernameController.text, password: passwordController.text)));
  }
}
