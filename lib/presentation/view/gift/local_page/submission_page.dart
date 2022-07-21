// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:keiko_good_day/presentation/view/visit/local_widget/cluster_list.dart';

class SubmissionPage extends StatefulWidget {
  const SubmissionPage({Key? key}) : super(key: key);

  @override
  State<SubmissionPage> createState() => _SubmissionPageState();
}

class _SubmissionPageState extends State<SubmissionPage> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () async {}, child: const ClusterList(isFromGift: true));
  }
}
