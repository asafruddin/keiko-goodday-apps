import 'package:flutter/material.dart';
import 'package:keiko_good_day/presentation/view/visit/rayon_page.dart';
import 'package:keiko_good_day/presentation/widget/card/app_card.dart';
import 'package:keiko_good_day/presentation/widget/card/card_list_content.dart';

class ClusterList extends StatelessWidget {
  const ClusterList({Key? key, this.isFromGift = false}) : super(key: key);

  final bool isFromGift;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!isFromGift)
          ListTile(
              title: Text('Daftar Cluster',
                  style: Theme.of(context).textTheme.headline5),
              contentPadding: EdgeInsets.zero),
        Expanded(
          flex: isFromGift ? 1 : 0,
          child: ListView.separated(
            padding: isFromGift ? const EdgeInsets.all(16) : EdgeInsets.zero,
            physics: isFromGift
                ? const AlwaysScrollableScrollPhysics()
                : const NeverScrollableScrollPhysics(),
            shrinkWrap: !isFromGift,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return AppCard(
                onPress: () {
                  Navigator.push<dynamic>(
                      context,
                      MaterialPageRoute<dynamic>(
                        builder: (context) => RayonPage(isFromGift: isFromGift),
                      ));
                },
                child: CardListContent(
                  subtitle: '8 Rayon',
                  title: 'Sidoarjo',
                  leading: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).primaryColor.withOpacity(0.1)),
                    child: Icon(
                      Icons.hub_outlined,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(height: 10),
          ),
        ),
      ],
    );
  }
}
