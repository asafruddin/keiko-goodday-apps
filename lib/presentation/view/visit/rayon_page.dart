import 'package:flutter/material.dart';
import 'package:keiko_good_day/presentation/view/shop/shop_list.dart';
import 'package:keiko_good_day/presentation/widget/card/app_card.dart';
import 'package:keiko_good_day/presentation/widget/search_bar/search_filter_bar.dart';

class RayonPage extends StatefulWidget {
  const RayonPage({Key? key}) : super(key: key);

  @override
  State<RayonPage> createState() => _RayonPageState();
}

class _RayonPageState extends State<RayonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchFilterBar(
          label: 'Daftar Rayon',
          isFilter: false,
          onSearchChanged: (p0) {},
        ),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return AppCard(
              onPress: () {
                Navigator.push<dynamic>(
                    context,
                    MaterialPageRoute<dynamic>(
                      builder: (context) => const ShopList(),
                    ));
              },
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).primaryColor.withOpacity(0.1)),
                    child: Icon(
                      Icons.share_outlined,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Krian',
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                        Text(
                          '17 Kedai',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.chevron_right_rounded)
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemCount: 19),
    );
  }
}
