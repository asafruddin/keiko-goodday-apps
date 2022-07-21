import 'package:flutter/material.dart';
import 'package:keiko_good_day/core/injection/di.dart';
import 'package:keiko_good_day/core/local_storage/shared_preferences.dart';
import 'package:keiko_good_day/presentation/view/auth/login_page.dart';

class UserCard extends StatelessWidget {
  UserCard({Key? key}) : super(key: key);

  final _prefs = sl<SharedPrefs>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
            backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=1')),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            'Hello, Monika Candra',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        IconButton(
            onPressed: () {
              _prefs.clearAll();
              Navigator.pushAndRemoveUntil<dynamic>(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (context) => const LoginPage(),
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
