// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keiko_good_day/core/injection/di.dart';
import 'package:keiko_good_day/core/utils/constant/url_constant.dart';
import 'package:keiko_good_day/domain/entity/product_entity.dart';
import 'package:keiko_good_day/domain/entity/shop_detail_entity.dart';
import 'package:keiko_good_day/presentation/bloc/master_data_loader/master_data_loader_bloc.dart';
import 'package:keiko_good_day/presentation/bloc/product/product_bloc.dart';
import 'package:keiko_good_day/presentation/view/checkout/checkout_page.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key, required this.shopDetail}) : super(key: key);
  final ShopDetailEntity shopDetail;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final masterBloc = sl<MasterDataLoaderBloc>();
  final productBloc = sl<ProductBloc>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => masterBloc..add(OnGetProductList())),
        BlocProvider(create: (context) => productBloc),
      ],
      child: Scaffold(
          appBar: AppBar(title: const Text('Pilih Product')),
          body: BlocBuilder<MasterDataLoaderBloc, MasterDataLoaderState>(
            buildWhen: (p, c) => p.productEntity != c.productEntity,
            builder: (context, state) {
              if (state.productEntity != null) {
                productBloc.add(OnInitialProductEvent(state.productEntity!));
              }
              return Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        itemBuilder: (context, index) {
                          final product = state.productEntity?.products![index];
                          return ProductItem(product: product, size: size);
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10),
                        itemCount: state.productEntity?.products?.length ?? 0),
                  ),
                  BlocBuilder<ProductBloc, ProductState>(
                    builder: (context, state) {
                      final totalProduct = state.productCartList?.fold(
                          0, (int sum, item) => sum + (item.quantity ?? 0));
                      if (totalProduct == 0) {
                        return const SizedBox();
                      }
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute<dynamic>(
                                  builder: (context) => CheckoutPage(
                                      shopDetailEntity: widget.shopDetail,
                                      productCartList: state.productCartList)));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text('Total Produk',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary)),
                              ),
                              Text('$totalProduct',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary)),
                              const SizedBox(width: 10),
                              Icon(Icons.chevron_right_rounded,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary)
                            ],
                          ),
                        ),
                      );
                    },
                  )
                ],
              );
            },
          )),
    );
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
    required this.product,
    required this.size,
  }) : super(key: key);

  final DataProductsEntity? product;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        final index = state.productCartList
                ?.indexWhere((element) => element.id == product!.id) ??
            -1;

        return InkWell(
          onTap: () {
            DataProductsEntity dataProduct;

            if ((state.productCartList?[index].quantity ?? 0) < 1) {
              dataProduct = product!.copyWith(quantity: 1);
            } else {
              dataProduct = state.productCartList![index];
            }

            context
                .read<ProductBloc>()
                .add(OnChangeProductQuantity(dataProduct));
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Expanded(
                    flex: 3,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(product?.name ?? '',
                              maxLines: 1,
                              style: Theme.of(context).textTheme.headline6),
                          const Divider(),
                          Text('${product?.point ?? ''} Point',
                              maxLines: 1,
                              style: Theme.of(context).textTheme.subtitle2),
                          Text(product?.description ?? '-',
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                      color: Theme.of(context).disabledColor)),
                          const SizedBox(height: 10),
                          if (state.productCartList?[index].quantity != 0)
                            CountProduct(product: product)
                        ])),
                const SizedBox(width: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: product?.img == null
                      ? Image.network(kImagePlaceholder,
                          height: size.width / 4.5, fit: BoxFit.fitHeight)
                      : Image.network(
                          '$kProductImageUrlConstant${product?.img}',
                          height: size.width / 4.5,
                          fit: BoxFit.fitHeight),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CountProduct extends StatefulWidget {
  const CountProduct({Key? key, required this.product}) : super(key: key);

  final DataProductsEntity? product;

  @override
  State<CountProduct> createState() => _CountProductState();
}

class _CountProductState extends State<CountProduct> {
  final counter = ValueNotifier<int?>(null);
  final productVal = ValueNotifier<DataProductsEntity?>(null);
  final index = ValueNotifier(-1);

  @override
  void initState() {
    super.initState();
    if (widget.product != null) {
      productVal.value = widget.product;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<ProductBloc, ProductState>(
      buildWhen: (p, c) => p.productCartList != c.productCartList,
      builder: (context, state) {
        final indexList = state.productCartList
                ?.indexWhere((element) => element.id == widget.product?.id) ??
            -1;
        if (counter.value == null) {
          counter.value = state.productCartList?[indexList].quantity ?? 0;
          context.read<ProductBloc>().add(OnChangeProductQuantity(
              productVal.value!.copyWith(quantity: counter.value)));
        } else {
          counter.value = state.productCartList?[indexList].quantity ?? 0;
        }
        return SizedBox(
          width: size.width / 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  onTap: () {
                    if (counter.value! > 0) {
                      context.read<ProductBloc>().add(OnChangeProductQuantity(
                          productVal.value!
                              .copyWith(quantity: counter.value! - 1)));
                    }
                  },
                  child: const Icon(Icons.remove_circle_rounded)),
              ValueListenableBuilder<int?>(
                  valueListenable: counter,
                  builder: (context, value, chilld) {
                    return Text(
                      value.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(fontWeight: FontWeight.bold),
                    );
                  }),
              InkWell(
                  onTap: () {
                    context.read<ProductBloc>().add(OnChangeProductQuantity(
                        productVal.value!
                            .copyWith(quantity: counter.value! + 1)));
                  },
                  child: const Icon(Icons.add_circle))
            ],
          ),
        );
      },
    );
  }
}
