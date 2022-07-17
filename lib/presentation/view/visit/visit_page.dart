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
        title: Image.network(
            'https://www.hidupbanyakrasa.com/requirement/images/logo-1.png',
            height: 30),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        children: const [
          UserCard(),
          SizedBox(height: 20),
          StatisticCard(),
          SizedBox(height: 20),
          ClusterList(),
        ],
      ),
    );
  }
}
