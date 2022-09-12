// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keiko_good_day/presentation/bloc/master_data_loader/master_data_loader_bloc.dart';
import 'package:keiko_good_day/presentation/view/visit/local_widget/cluster_list.dart';

class SubmissionPage extends StatefulWidget {
  const SubmissionPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SubmissionPage> createState() => _SubmissionPageState();
}

class _SubmissionPageState extends State<SubmissionPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MasterDataLoaderBloc, MasterDataLoaderState>(
      builder: (context, state) {
        return RefreshIndicator(
            onRefresh: () async {},
            child: ClusterList(
              isFromGift: true,
              clusters: state.clusterEntity,
            ));
      },
    );
  }
}
