import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keiko_good_day/core/injection/di.dart';
import 'package:keiko_good_day/core/utils/constant/url_constant.dart';
import 'package:keiko_good_day/domain/entity/shops_entity.dart';
import 'package:keiko_good_day/presentation/bloc/master_data_loader/master_data_loader_bloc.dart';
import 'package:keiko_good_day/presentation/view/gift/choose_gift_page.dart';
import 'package:keiko_good_day/presentation/view/shop/shop_page.dart';
import 'package:keiko_good_day/presentation/widget/card/app_card.dart';
import 'package:keiko_good_day/presentation/widget/search_bar/search_filter_bar.dart';

class ShopList extends StatefulWidget {
  const ShopList({Key? key, this.isFromGift = false, this.idRayons = 2})
      : super(key: key);

  final bool isFromGift;
  final int idRayons;

  @override
  State<ShopList> createState() => _ShopListState();
}

class _ShopListState extends State<ShopList> {
  final masterBloc = sl<MasterDataLoaderBloc>();

  @override
  void initState() {
    super.initState();
    masterBloc.add(OnGetShopList(widget.idRayons));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => masterBloc,
      child: Scaffold(
        appBar: AppBar(
          title: SearchFilterBar(
            label: 'Daftar Kedai',
            isFilter: false,
            onSearchChanged: (p0) => masterBloc.add(OnShopSearch(p0)),
          ),
        ),
        body: BlocBuilder<MasterDataLoaderBloc, MasterDataLoaderState>(
          builder: (context, state) {
            var shops = <DataShopsEntity>[];
            if (state.shopSearchEntity?.shops?.isNotEmpty ?? false) {
              shops = state.shopSearchEntity?.shops ?? [];
            } else {
              shops = state.shopEntity?.shops ?? [];
            }

            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.errorMsg != null) {
              return Center(
                child: Text(
                  state.errorMsg ?? 'Terjadi Kesalahan',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              );
            }
            if (shops.isEmpty) {
              return Center(
                child: Text(
                  'Data Rayon Kosong',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              );
            }

            return ListView.separated(
                itemBuilder: (context, index) {
                  final shop = shops[index];

                  return InkWell(
                    onTap: () => Navigator.push<dynamic>(
                        context,
                        MaterialPageRoute<dynamic>(
                            builder: (context) => widget.isFromGift
                                ? ChooseGift(shopId: shop.id)
                                : ShopPage(
                                    idShop: shop.id!,
                                    imgSrc:
                                        'https://media-cdn.tripadvisor.com/media/photo-s/1b/3f/c1/f1/kj-coffee-shop-es-un.jpg'))),
                    child: AppCard(
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: shop.img != null
                                ? Image.network(
                                    '$kShopImageUrlConstant${shop.img}',
                                    height: size.width / 4.5,
                                    fit: BoxFit.fitHeight,
                                  )
                                : Image.network(
                                    kImagePlaceholder,
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
                                  shop.name!,
                                  maxLines: 1,
                                  style: Theme.of(context).textTheme.subtitle2,
                                ),
                                const Divider(),
                                Text(
                                  shop.telp ?? '-',
                                  maxLines: 1,
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                Text(
                                  shop.address!,
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
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemCount: shops.length);
          },
        ),
      ),
    );
  }
}
