// ignore_for_file: cascade_invocations, use_decorated_box

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keiko_good_day/core/injection/di.dart';
import 'package:keiko_good_day/data/model/request/purchasing/purchasing_body.dart';
import 'package:keiko_good_day/domain/entity/product_entity.dart';
import 'package:keiko_good_day/domain/entity/shop_detail_entity.dart';
import 'package:keiko_good_day/presentation/bloc/product/product_bloc.dart';
import 'package:keiko_good_day/presentation/view/navigation/seller_navigation.dart';
import 'package:keiko_good_day/presentation/widget/loader/loader_overlay.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage(
      {Key? key, this.productCartList, required this.shopDetailEntity})
      : super(key: key);

  final List<DataProductsEntity>? productCartList;
  final ShopDetailEntity shopDetailEntity;

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final productBloc = sl<ProductBloc>();

  @override
  Widget build(BuildContext context) {
    final products =
        List.generate(widget.productCartList?.length ?? 0, (index) {
      if ((widget.productCartList?[index].quantity ?? 0) > 0) {
        return widget.productCartList?[index];
      }
    });
    products.removeWhere((element) => element == null);

    return BlocProvider(
      create: (context) => productBloc,
      child: Scaffold(
        appBar: AppBar(title: const Text('Checkout')),
        body: BlocListener<ProductBloc, ProductState>(
          listener: (context, state) {
            state.failOrSuccess?.fold((l) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(l.message.toString())));
            }, (r) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Success menyimpan')));

              Future.delayed(
                  const Duration(seconds: 3),
                  () => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute<dynamic>(
                        builder: (context) => const SellerNavigation(),
                      ),
                      (route) => false));
            });
          },
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            final product = products[index];
                            return ListTile(
                                title: Text(
                                  product!.name!,
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                trailing: Text(product.quantity.toString(),
                                    style:
                                        Theme.of(context).textTheme.subtitle2),
                                subtitle: Text(
                                  '${product.point} point',
                                ));
                          },
                          separatorBuilder: (context, index) =>
                              const Divider(height: 0),
                          itemCount: products.length)),
                  Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, -6),
                              color: Theme.of(context)
                                  .disabledColor
                                  .withOpacity(0.03),
                              blurRadius: 5)
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text(
                            'Point ${widget.shopDetailEntity.shop?.name}',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                              '${widget.shopDetailEntity.shop!.point} Point',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).disabledColor)),
                        ),
                        ListTile(
                          title: Text('Total Belanja',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(fontWeight: FontWeight.bold)),
                          subtitle: Text(
                            '${getTotalPoint(products)} Point',
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).disabledColor),
                          ),
                          trailing: TextButton(
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.symmetric(
                                          horizontal: 10))),
                              onPressed: () => onSubmit(context, products),
                              child: const Text('Simpan')),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20)
                ],
              ),
              BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
                if (state.isSubmiting) {
                  return const LoaderOverlay(loadingTitle: 'Proses');
                } else {
                  return const SizedBox.shrink();
                }
              })
            ],
          ),
        ),
      ),
    );
  }

  void onSubmit(BuildContext context, List<DataProductsEntity?> products) {
    final body = PurchasingBody(
        shopId: widget.shopDetailEntity.shop?.id.toString() ?? '',
        isCreate: '2',
        wholesaleDealLines: products
            .map((e) =>
                WholesaleDealLines(itemId: e?.id.toString(), qty: e?.quantity))
            .toList(),
        pointTotal: getTotalPoint(products).toString());

    productBloc.add(OnPurchasingProduct(body));
  }

  double getTotalPoint(List<DataProductsEntity?> products) {
    final list = products.map((e) {
      return e!.quantity! * double.tryParse(e.point!)!;
    }).toList();

    final totalPoint = list.reduce((value, element) => value + element);

    return totalPoint;
  }
}
