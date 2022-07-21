import 'package:flutter/material.dart';
import 'package:keiko_good_day/presentation/view/gift/choose_gift_page.dart';
import 'package:keiko_good_day/presentation/view/shop/shop_page.dart';
import 'package:keiko_good_day/presentation/widget/card/app_card.dart';
import 'package:keiko_good_day/presentation/widget/search_bar/search_filter_bar.dart';

class ShopList extends StatefulWidget {
  const ShopList({Key? key, this.isFromGift = false}) : super(key: key);

  final bool isFromGift;

  @override
  State<ShopList> createState() => _ShopListState();
}

class _ShopListState extends State<ShopList> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: SearchFilterBar(
          label: 'Daftar Kedai',
          isFilter: false,
          onSearchChanged: (p0) {},
        ),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => Navigator.push<dynamic>(
                  context,
                  MaterialPageRoute<dynamic>(
                      builder: (context) => widget.isFromGift
                          ? const ChooseGift()
                          : const ShopPage(
                              imgSrc:
                                  'https://media-cdn.tripadvisor.com/media/photo-s/1b/3f/c1/f1/kj-coffee-shop-es-un.jpg'))),
              child: AppCard(
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        'https://media-cdn.tripadvisor.com/media/photo-s/1b/3f/c1/f1/kj-coffee-shop-es-un.jpg',
                        height: size.width / 4.5,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Kedai Kopi Mantap',
                            maxLines: 1,
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                          const Divider(),
                          Text(
                            'Joko Saputro',
                            maxLines: 1,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          Text(
                            '''
Jl. Satelit Indah II Blok FN No.8, Tanjungsari, Kec. Sukomanunggal, Kota SBY, Jawa Timur 60187''',
                            maxLines: 2,
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemCount: 10),
    );
  }
}
