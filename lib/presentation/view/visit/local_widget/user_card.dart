import 'package:flutter/material.dart';
import 'package:keiko_good_day/core/injection/di.dart';
import 'package:keiko_good_day/core/local_storage/shared_preferences.dart';
import 'package:keiko_good_day/core/utils/constant/key_constant.dart';
import 'package:keiko_good_day/presentation/view/intro/intro_menu.dart';

class UserCard extends StatelessWidget {
  UserCard({Key? key}) : super(key: key);

  final _prefs = sl<SharedPrefs>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
            backgroundColor: Theme.of(context).disabledColor,
            child: Icon(Icons.person_rounded,
                color: Theme.of(context).colorScheme.onPrimary)),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            'Hello, ${_prefs.getString(KeyConstant.keyUserName)}',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        IconButton(
            onPressed: () {
              _prefs.clearAll();
              Navigator.pushAndRemoveUntil<dynamic>(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (context) => const IntroMenu(),
                  ),
                  (route) => false);
            },
            icon: Icon(
              Icons.logout_rounded,
              color: Theme.of(context).colorScheme.primary,
            ))
      ],
    );
  }
}
