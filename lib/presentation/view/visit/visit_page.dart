import 'package:flutter/material.dart';
import 'package:keiko_good_day/presentation/view/visit/local_widget/cluster_list.dart';
import 'package:keiko_good_day/presentation/view/visit/local_widget/statistic_card.dart';
import 'package:keiko_good_day/presentation/view/visit/local_widget/user_card.dart';

class VisitPage extends StatefulWidget {
  const VisitPage({Key? key}) : super(key: key);

  @override
  State<VisitPage> createState() => _VisitPageState();
}

class _VisitPageState extends State<VisitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Image.asset('assets/img_logo.png', height: 50),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        children: [
          UserCard(),
          const SizedBox(height: 20),
          const StatisticCard(),
          const SizedBox(height: 20),
          const ClusterList(),
        ],
      ),
    );
  }
}
