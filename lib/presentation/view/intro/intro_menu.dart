import 'package:flutter/material.dart';
import 'package:keiko_good_day/core/injection/di.dart';
import 'package:keiko_good_day/core/local_storage/shared_preferences.dart';
import 'package:keiko_good_day/core/utils/constant/key_constant.dart';
import 'package:keiko_good_day/presentation/view/auth/login_page.dart';
import 'package:lottie/lottie.dart';

class IntroMenu extends StatefulWidget {
  const IntroMenu({Key? key}) : super(key: key);

  @override
  State<IntroMenu> createState() => _IntroMenuState();
}

class _IntroMenuState extends State<IntroMenu> {
  final isMotorisSelected = ValueNotifier<bool>(true);
  final _prefs = sl<SharedPrefs>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: AppBar().preferredSize.height),
              Image.asset('assets/img_logo.png'),
              SizedBox(height: size.width / 6),
              ValueListenableBuilder<bool>(
                  valueListenable: isMotorisSelected,
                  builder: (context, value, child) {
                    return Expanded(
                        child: Lottie.asset(value
                            ? 'assets/lottie_motoris.json'
                            : 'assets/lottie_grosir.json'));
                  }),
              SizedBox(height: size.width / 4),
              Text('Masuk Sebagai',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary)),
              Text(
                  'Anda bisa masuk sebagai motoris atau sebagai pemilik grosir',
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: Theme.of(context).colorScheme.secondary)),
              const SizedBox(height: 20),
              ValueListenableBuilder<bool>(
                  valueListenable: isMotorisSelected,
                  builder: (context, value, child) {
                    return Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                              style: ButtonStyle(
                                side: MaterialStateProperty.all(BorderSide(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary)),
                                foregroundColor: value
                                    ? MaterialStateProperty.all(
                                        Theme.of(context)
                                            .colorScheme
                                            .onSecondary)
                                    : MaterialStateProperty.all(
                                        Theme.of(context)
                                            .colorScheme
                                            .secondary),
                                backgroundColor: value
                                    ? MaterialStateProperty.all(
                                        Theme.of(context).colorScheme.secondary)
                                    : null,
                                textStyle: MaterialStateProperty.all(
                                    Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(
                                            letterSpacing: 1.25,
                                            fontWeight: FontWeight.bold)),
                              ),
                              onPressed: () => isMotorisSelected.value = true,
                              child: const Text('Motoris')),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: OutlinedButton(
                              style: ButtonStyle(
                                side: MaterialStateProperty.all(BorderSide(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary)),
                                foregroundColor: value
                                    ? MaterialStateProperty.all(
                                        Theme.of(context).colorScheme.secondary)
                                    : MaterialStateProperty.all(
                                        Theme.of(context)
                                            .colorScheme
                                            .onSecondary),
                                backgroundColor: value
                                    ? null
                                    : MaterialStateProperty.all(
                                        Theme.of(context)
                                            .colorScheme
                                            .secondary),
                                textStyle: MaterialStateProperty.all(
                                    Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(
                                            letterSpacing: 1.25,
                                            fontWeight: FontWeight.bold)),
                              ),
                              onPressed: () => isMotorisSelected.value = false,
                              child: const Text('Grosir')),
                        ),
                      ],
                    );
                  }),
              SizedBox(height: size.width / 6),
              TextButton(
                  onPressed: () {
                    saveType();
                    Navigator.push<dynamic>(
                        context,
                        MaterialPageRoute<dynamic>(
                          builder: (context) => LoginPage(
                              isLoginAsMotoris: isMotorisSelected.value),
                        ));
                  },
                  child: const Text('Masuk')),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  void saveType() async {
    await _prefs.putString(KeyConstant.keyUserType,
        isMotorisSelected.value ? 'motoris' : 'grosir');
  }
}
