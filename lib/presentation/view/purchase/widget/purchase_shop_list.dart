import 'package:flutter/material.dart';
import 'package:keiko_good_day/core/utils/constant/url_constant.dart';
import 'package:keiko_good_day/domain/entity/shops_entity.dart';
import 'package:keiko_good_day/presentation/view/shop/shop_page.dart';
import 'package:keiko_good_day/presentation/widget/card/app_card.dart';

class PurchaseShopList extends StatelessWidget {
  const PurchaseShopList({Key? key, required this.shops}) : super(key: key);

  final List<DataShopsEntity> shops;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Daftar Kedai', style: Theme.of(context).textTheme.headline5),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          itemBuilder: (BuildContext context, int index) {
            final shop = shops[index];
            return InkWell(
              onTap: () => Navigator.push<dynamic>(
                  context,
                  MaterialPageRoute<dynamic>(
                      builder: (context) => ShopPage(
                          idShop: shop.id!,
                          isFromPurchase: true,
                          imgSrc: '$kShopImageUrlConstant${shop.img}'))),
              child: AppCard(
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: shop.img == null
                          ? Image.network(
                              kImagePlaceholder,
                              height: size.width / 4.5,
                              fit: BoxFit.fitHeight,
                            )
                          : Image.network(
                              '$kShopImageUrlConstant${shop.img}',
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
                            shop.name ?? '-',
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
          itemCount: shops.length,
          separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(height: 10),
        )
      ],
    );
  }
}
