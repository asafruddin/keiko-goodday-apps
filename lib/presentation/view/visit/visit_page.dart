import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keiko_good_day/core/injection/di.dart';
import 'package:keiko_good_day/presentation/bloc/master_data_loader/master_data_loader_bloc.dart';
import 'package:keiko_good_day/presentation/view/visit/local_widget/cluster_list.dart';
import 'package:keiko_good_day/presentation/view/visit/local_widget/statistic_card.dart';
import 'package:keiko_good_day/presentation/view/visit/local_widget/user_card.dart';

class VisitPage extends StatefulWidget {
  const VisitPage({Key? key}) : super(key: key);

  @override
  State<VisitPage> createState() => _VisitPageState();
}

class _VisitPageState extends State<VisitPage> {
  final masterBloc = sl<MasterDataLoaderBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Image.asset('assets/img_logo.png', height: 50),
        // actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: BlocProvider(
        create: (context) => masterBloc
          ..add(OnGetStatistic())
          ..add(OnGetClusterList()),
        child: BlocBuilder<MasterDataLoaderBloc, MasterDataLoaderState>(
          builder: (context, state) {
            return RefreshIndicator(
              onRefresh: () => Future.sync(() {
                context.read<MasterDataLoaderBloc>().add(OnGetStatistic());
                context.read<MasterDataLoaderBloc>().add(OnGetClusterList());
              }),
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                children: [
                  UserCard(),
                  const SizedBox(height: 20),
                  StatisticCard(statistic: state.statisticEntity),
                  const SizedBox(height: 20),
                  ClusterList(clusters: state.clusterEntity),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
