// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:keiko_good_day/presentation/widget/card/app_card.dart';

class SubmissionPage extends StatefulWidget {
  const SubmissionPage({Key? key}) : super(key: key);

  @override
  State<SubmissionPage> createState() => _SubmissionPageState();
}

class _SubmissionPageState extends State<SubmissionPage> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (BuildContext context, int index) {
          return AppCard(
            backgroundColor: Colors.transparent,
            child: Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                        'https://img.okezone.com/content/2022/04/25/301/2584936/inilah-5-cafe-di-tangerang-yang-cocok-untuk-work-from-home-dufdojKhDB.JPG',
                        width: 100)),
                const SizedBox(width: 8),
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Text('Kedai kopi mantap',
                          style: Theme.of(context).textTheme.headline6),
                      Text(
                          'Jl. Satelit Indah II Blok FN No.8, Tanjungsari, Kec. Sukomanunggal, Kota SBY, Jawa Timur 60187',
                          style: Theme.of(context).textTheme.caption),
                    ])),
                const SizedBox(width: 8),
                const Icon(Icons.chevron_right_rounded),
              ],
            ),
          );
        },
        itemCount: 10,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
