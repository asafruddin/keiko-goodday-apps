import 'package:flutter/material.dart';
import 'package:keiko_good_day/presentation/widget/card/app_card.dart';
import 'package:keiko_good_day/presentation/widget/card/card_list_content.dart';

class ChooseGift extends StatefulWidget {
  const ChooseGift({Key? key}) : super(key: key);

  @override
  State<ChooseGift> createState() => _ChooseGiftState();
}

class _ChooseGiftState extends State<ChooseGift> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pilih Hadiah')),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return AppCard(
              child: CardListContent(
                title: 'Setrika',
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/4/4d/Electric_iron_lie.jpg',
                    width: 46,
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemCount: 10),
    );
  }
}
