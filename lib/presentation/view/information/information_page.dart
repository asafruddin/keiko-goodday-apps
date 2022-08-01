import 'package:flutter/material.dart';
import 'package:keiko_good_day/presentation/widget/card/app_card.dart';
import 'package:keiko_good_day/presentation/widget/card/card_list_content.dart';
import 'package:keiko_good_day/presentation/widget/search_bar/search_filter_bar.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: SearchFilterBar(
          label: 'Informasi',
          isFilter: false,
          onSearchChanged: (p0) {},
        )),
        body: ListView.separated(
            itemBuilder: (context, index) {
              return AppCard(
                child: CardListContent(
                  title: 'Promo 20%',
                  subtitle: '20 September 2022',
                  leading: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).primaryColor.withOpacity(0.1)),
                    child: Icon(
                      Icons.info_outline,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: 10));
  }
}
