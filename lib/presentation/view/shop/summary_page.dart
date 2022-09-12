import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keiko_good_day/core/injection/di.dart';
import 'package:keiko_good_day/presentation/bloc/master_data_loader/master_data_loader_bloc.dart';
import 'package:keiko_good_day/presentation/view/shop/report_picture_page.dart';
import 'package:url_launcher/url_launcher.dart';

class SummaryPage extends StatefulWidget {
  const SummaryPage({Key? key, required this.shopId, this.criteriaData})
      : super(key: key);
  final int? shopId;
  final List<PictureConfirmationData>? criteriaData;

  @override
  State<SummaryPage> createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  final masterBloc = sl<MasterDataLoaderBloc>();

  double getTotalPoint() {
    return widget.criteriaData
            ?.fold(0, (sum, element) => (sum ?? 0) + (element.point ?? 0)) ??
        0;
  }

  @override
  void initState() {
    super.initState();
    masterBloc.add(OnGetShopDetail(widget.shopId!));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => masterBloc,
      child: Scaffold(
        appBar: AppBar(title: const Text('Ringkasan')),
        body: BlocBuilder<MasterDataLoaderBloc, MasterDataLoaderState>(
          builder: (context, state) {
            final shopDetail = state.shopDetailEntity?.shop;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          final data = widget.criteriaData![index];
                          return ListTile(
                            tileColor: Colors.white,
                            title: Text(data.category ?? ''),
                            trailing: Text(data.point.toString()),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const Divider(height: 0),
                        itemCount: widget.criteriaData?.length ?? 0)),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    'Selamat anda mendapatkan point total : ',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                ListTile(
                    tileColor: Colors.white,
                    title: Text('Total',
                        style: Theme.of(context).textTheme.headline6),
                    trailing: Text(getTotalPoint().toString(),
                        style: Theme.of(context).textTheme.headline6)),
                const Divider(height: 1.5, thickness: 2),
                ListTile(
                    tileColor: Colors.white,
                    title: Text('Total point saat ini',
                        style: Theme.of(context).textTheme.headline6),
                    trailing: Text('${shopDetail?.point.toString() ?? 0}',
                        style: Theme.of(context).textTheme.headline6)),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextButton(
                      onPressed: () async {
                        if (shopDetail?.telp != null &&
                            (shopDetail?.telp?.isNotEmpty ?? false)) {
                          await launchUrl(Uri.parse(
                              'whatsapp://send?text=Total Point Anda adalah ${shopDetail?.point.toString() ?? 0} point&phone=${shopDetail?.telp!.replaceFirst('0', '62')}'));
                        }
                      },
                      child: const Text('Kirim Laporan')),
                ),
                const SizedBox(height: 20)
              ],
            );
          },
        ),
      ),
    );
  }
}
