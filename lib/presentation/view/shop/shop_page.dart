// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:keiko_good_day/presentation/view/product/product_page.dart';
import 'package:keiko_good_day/presentation/view/shop/report_picture_page.dart';
import 'package:keiko_good_day/presentation/widget/card/app_card.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key, this.imgSrc, this.isFromPurchase = false})
      : super(key: key);

  final String? imgSrc;
  final bool isFromPurchase;

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Kedai')),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Image.network(widget.imgSrc!),
                    AppCard(
                      backgroundColor: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text('Kedai Kopi Mantap',
                              style: Theme.of(context).textTheme.headline5),
                          const SizedBox(height: 10),
                          ShopRowContent(
                              content: 'Joko Suparto',
                              contentStyle:
                                  Theme.of(context).textTheme.subtitle2,
                              leading: Icon(Icons.person,
                                  color: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .color)),
                          ShopRowContent(
                              content: '08139283948290',
                              contentStyle:
                                  Theme.of(context).textTheme.subtitle2,
                              leading: Icon(Icons.phone,
                                  color: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .color)),
                          ShopRowContent(
                              content:
                                  'Jl. Satelit Indah II Blok FN No.8, Tanjungsari, Kec. Sukomanunggal, Kota SBY, Jawa Timur 60187',
                              leading: Icon(Icons.place_rounded,
                                  color: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .color)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (widget.isFromPurchase)
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextButton(
                      onPressed: () {
                        Navigator.push<dynamic>(
                            context,
                            MaterialPageRoute<dynamic>(
                                builder: (context) => const ProductPage()));
                      },
                      child: const Text('Mulai Berbelanja')),
                )
              else
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextButton(
                      onPressed: () {
                        Navigator.push<dynamic>(
                            context,
                            MaterialPageRoute<dynamic>(
                                builder: (context) =>
                                    const ReportPicturePage()));
                      },
                      child: const Text('Laporan')),
                )
            ],
          ),
        ));
  }
}

class ShopRowContent extends StatelessWidget {
  const ShopRowContent(
      {Key? key, this.leading, this.content, this.contentStyle})
      : super(key: key);

  final Widget? leading;
  final String? content;
  final TextStyle? contentStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          leading ?? const SizedBox(),
          const SizedBox(width: 10),
          Expanded(
              child: Text(content ?? '',
                  style: contentStyle ?? Theme.of(context).textTheme.caption))
        ],
      ),
    );
  }
}
