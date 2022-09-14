// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:keiko_good_day/core/injection/di.dart';
import 'package:keiko_good_day/core/utils/constant/url_constant.dart';
import 'package:keiko_good_day/presentation/bloc/master_data_loader/master_data_loader_bloc.dart';
import 'package:keiko_good_day/presentation/view/product/product_page.dart';
import 'package:keiko_good_day/presentation/view/shop/report_picture_page.dart';
import 'package:keiko_good_day/presentation/widget/card/app_card.dart';

class ShopPage extends StatefulWidget {
  const ShopPage(
      {Key? key,
      this.imgSrc,
      this.isFromPurchase = false,
      required this.idShop})
      : super(key: key);

  final String? imgSrc;
  final bool isFromPurchase;
  final int idShop;

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final masterBloc = sl<MasterDataLoaderBloc>();
  final enableReportButton = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    masterBloc.add(OnGetShopDetail(widget.idShop));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => masterBloc,
      child: Scaffold(
          appBar: AppBar(title: const Text('Kedai')),
          body: BlocBuilder<MasterDataLoaderBloc, MasterDataLoaderState>(
            builder: (context, state) {
              final shop = state.shopDetailEntity?.shop;

              getCurrentLocation().then(
                (value) {
                  final distance = Geolocator.distanceBetween(
                      value.latitude,
                      value.longitude,
                      double.tryParse(shop?.lat ?? '') ?? 0,
                      double.tryParse(shop?.lang ?? '') ?? 0);

                  enableReportButton.value = distance <= 100;
                },
              );
              return SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          if (shop?.img != null)
                            Image.network('$kShopImageUrlConstant${shop?.img}')
                          else
                            Image.network(kImagePlaceholder, fit: BoxFit.cover),
                          AppCard(
                            backgroundColor: Colors.transparent,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(shop?.name ?? 'No Name',
                                    style:
                                        Theme.of(context).textTheme.headline5),
                                const SizedBox(height: 10),
                                ShopRowContent(
                                    content: shop?.telp?.isEmpty ?? true
                                        ? '-'
                                        : shop?.telp ?? '-',
                                    contentStyle:
                                        Theme.of(context).textTheme.subtitle2,
                                    leading: Icon(Icons.phone,
                                        color: Theme.of(context)
                                            .textTheme
                                            .caption!
                                            .color)),
                                ShopRowContent(
                                    content: shop?.address ?? '-',
                                    leading: Icon(Icons.place_rounded,
                                        color: Theme.of(context)
                                            .textTheme
                                            .caption!
                                            .color)),
                                ShopRowContent(
                                    content: '${shop?.point ?? 0} Point',
                                    contentStyle:
                                        Theme.of(context).textTheme.subtitle2,
                                    leading: Icon(Icons.shopping_bag_rounded,
                                        color: Theme.of(context)
                                            .textTheme
                                            .caption!
                                            .color)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (widget.isFromPurchase)
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: TextButton(
                            onPressed: () {
                              Navigator.push<dynamic>(
                                  context,
                                  MaterialPageRoute<dynamic>(
                                      builder: (context) => ProductPage(
                                          shopDetail:
                                              state.shopDetailEntity!)));
                            },
                            child: const Text('Mulai Berbelanja')),
                      )
                    else
                      ValueListenableBuilder<bool>(
                          valueListenable: enableReportButton,
                          builder: (context, value, child) {
                            return Padding(
                              padding: const EdgeInsets.all(16),
                              child: TextButton(
                                  style: ButtonStyle(
                                      backgroundColor: value
                                          ? null
                                          : MaterialStateProperty.all(
                                              Theme.of(context).disabledColor)),
                                  onPressed: value
                                      ? () {
                                          Navigator.push<dynamic>(
                                              context,
                                              MaterialPageRoute<dynamic>(
                                                  builder: (context) =>
                                                      ReportPicturePage(
                                                          shopDetail: state
                                                              .shopDetailEntity!)));
                                        }
                                      : null,
                                  child: const Text('Laporan')),
                            );
                          })
                  ],
                ),
              );
            },
          )),
    );
  }

  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return Geolocator.getCurrentPosition();
  }
}

class ShopRowContent extends StatelessWidget {
  const ShopRowContent(
      {Key? key, this.leading, this.content, this.contentStyle})
      : super(key: key);

  final Widget? leading;
  final String? content;
  final TextStyle? contentStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          leading ?? const SizedBox(),
          const SizedBox(width: 10),
          Expanded(
              child: Text(content ?? '',
                  style: contentStyle ?? Theme.of(context).textTheme.caption))
        ],
      ),
    );
  }
}
