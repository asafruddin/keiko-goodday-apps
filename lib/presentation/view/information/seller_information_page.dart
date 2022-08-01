import 'package:flutter/material.dart';
import 'package:keiko_good_day/presentation/widget/search_bar/search_filter_bar.dart';

class SellerInformationPage extends StatefulWidget {
  const SellerInformationPage({Key? key}) : super(key: key);

  @override
  State<SellerInformationPage> createState() => _SellerInformationPageState();
}

class _SellerInformationPageState extends State<SellerInformationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: SearchFilterBar(
        label: 'Informasi',
        isFilter: false,
        onSearchChanged: (p0) {},
      )),
    );
  }
}
