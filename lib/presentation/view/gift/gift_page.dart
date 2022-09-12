import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keiko_good_day/core/injection/di.dart';
import 'package:keiko_good_day/presentation/bloc/master_data_loader/master_data_loader_bloc.dart';
import 'package:keiko_good_day/presentation/view/gift/local_page/exchange_page.dart';
import 'package:keiko_good_day/presentation/view/gift/local_page/submission_page.dart';

class GiftPage extends StatefulWidget {
  const GiftPage({Key? key}) : super(key: key);

  @override
  State<GiftPage> createState() => _GiftPageState();
}

class _GiftPageState extends State<GiftPage> with TickerProviderStateMixin {
  TabController? tabController;
  final masterDataBloc = sl<MasterDataLoaderBloc>();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final tabs = [
      const Tab(child: Text('Pengajuan')),
      const Tab(child: Text('Laporan Penukaran'))
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Hadiah')),
      body: BlocProvider(
        create: (context) => masterDataBloc..add(OnGetClusterList()),
        child: Column(
          children: [
            TabBar(
                indicatorColor: Theme.of(context).colorScheme.primary,
                labelColor: Theme.of(context).colorScheme.primary,
                controller: tabController,
                tabs: tabs),
            Expanded(
                child: TabBarView(
                    controller: tabController,
                    children: const [SubmissionPage(), ExchangePage()]))
          ],
        ),
      ),
    );
  }
}
