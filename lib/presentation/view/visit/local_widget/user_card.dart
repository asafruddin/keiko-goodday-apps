import 'package:flutter/material.dart';
import 'package:keiko_good_day/presentation/view/auth/login_page.dart';

class UserCard extends StatelessWidget {
  const UserCard({Key? key}) : super(key: key);

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
            onPressed: () => Navigator.pushAndRemoveUntil<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (context) => const LoginPage(),
                ),
                (route) => false),
            icon: Icon(
              Icons.logout_rounded,
              color: Theme.of(context).colorScheme.primary,
            ))
      ],
    );
  }
}
