import 'package:flutter/material.dart';
import 'package:keiko_good_day/presentation/view/purchase/widget/purchase_shop_list.dart';
import 'package:keiko_good_day/presentation/view/visit/local_widget/user_card.dart';

class PurchasePage extends StatefulWidget {
  const PurchasePage({Key? key}) : super(key: key);

  @override
  State<PurchasePage> createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset('assets/img_logo.png', height: 50),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.search, color: Theme.of(context).primaryColor))
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          children: [
            UserCard(),
            const SizedBox(height: 10),
            const PurchaseShopList(),
          ],
        ));
  }
}
