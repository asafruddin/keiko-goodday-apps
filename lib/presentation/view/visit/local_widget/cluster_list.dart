import 'package:flutter/material.dart';
import 'package:keiko_good_day/presentation/view/visit/rayon_page.dart';
import 'package:keiko_good_day/presentation/widget/card/app_card.dart';

class ClusterList extends StatelessWidget {
  const ClusterList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
            title: Text('Daftar Cluster',
                style: Theme.of(context).textTheme.headline5),
            contentPadding: EdgeInsets.zero),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return AppCard(
              onPress: () {
                Navigator.push<dynamic>(
                    context,
                    MaterialPageRoute<dynamic>(
                      builder: (context) => const RayonPage(),
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
                      Icons.hub_outlined,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sidoarjo',
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                        Text(
                          '3 Rayon',
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
          separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(height: 10),
        ),
      ],
    );
  }
}
