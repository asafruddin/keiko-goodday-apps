// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keiko_good_day/core/injection/di.dart';
import 'package:keiko_good_day/core/local_storage/shared_preferences.dart';
import 'package:keiko_good_day/core/utils/constant/key_constant.dart';
import 'package:keiko_good_day/core/utils/constant/url_constant.dart';
import 'package:keiko_good_day/data/model/request/redeem_gift/redeem_gift_body.dart';
import 'package:keiko_good_day/domain/entity/gift_entity.dart';
import 'package:keiko_good_day/presentation/bloc/master_data_loader/master_data_loader_bloc.dart';
import 'package:keiko_good_day/presentation/bloc/product/product_bloc.dart';
import 'package:keiko_good_day/presentation/view/navigation/navigation.dart';
import 'package:keiko_good_day/presentation/widget/card/app_card.dart';
import 'package:keiko_good_day/presentation/widget/card/card_list_content.dart';
import 'package:keiko_good_day/presentation/widget/loader/loader_overlay.dart';

class ChooseGift extends StatefulWidget {
  const ChooseGift({Key? key, required this.shopId}) : super(key: key);

  final int? shopId;

  @override
  State<ChooseGift> createState() => _ChooseGiftState();
}

class _ChooseGiftState extends State<ChooseGift> {
  final masterBloc = sl<MasterDataLoaderBloc>();
  final productBloc = sl<ProductBloc>();

  @override
  void initState() {
    super.initState();
    masterBloc.add(OnGetGiftList());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => masterBloc),
        BlocProvider(create: (context) => productBloc),
      ],
      child: BlocListener<ProductBloc, ProductState>(
        listener: (context, state) {
          state.failOrSuccess!.fold(
              (l) => ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(l.message.toString()))),
              (r) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Success menukarkan point')));
            Future.delayed(
                const Duration(seconds: 3), () => Navigator.pop(context));
          });
        },
        child: Scaffold(
          appBar: AppBar(title: const Text('Pilih Hadiah')),
          body: Stack(
            children: [
              BlocBuilder<MasterDataLoaderBloc, MasterDataLoaderState>(
                  builder: (context, state) {
                return ListView.separated(
                    itemBuilder: (context, index) {
                      final gift = state.giftEntity?.gift?[index];
                      return AppCard(
                        onPress: () => onShowConfirmationDialog(context, gift),
                        child: CardListContent(
                          title: gift?.name ?? '-',
                          subtitle: '${gift?.point ?? 0} Point',
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              '$kProductImageUrlConstant${gift?.img}',
                              width: size.width / 4.5,
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    itemCount: state.giftEntity?.gift?.length ?? 0);
              }),
              BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
                if (state.isSubmiting) {
                  return const LoaderOverlay(loadingTitle: 'Proses');
                }
                return const SizedBox.shrink();
              })
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onShowConfirmationDialog(
      BuildContext context, DataGiftEntity? gift) async {
    final userId = sl<SharedPrefs>().getInt(KeyConstant.keyUserId);

    return showModalBottomSheet<bool>(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        context: context,
        builder: (context) => ConfirmationDialog(gift: gift)).then((value) {
      if (value!) {
        final body = RedeemGiftBody(
            itemId: gift!.id,
            shopId: widget.shopId,
            point: gift.point,
            motorisId: userId);
        productBloc.add(OnRedeemGift(body));
      }
    });
  }
}

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({Key? key, this.gift}) : super(key: key);
  final DataGiftEntity? gift;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Konfirmasi Pilih Hadiah',
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Text('Apakah anda yakin memilih hadiah dibawah ini?',
              style: Theme.of(context).textTheme.bodyText2),
          AppCard(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: CardListContent(
              isWithTrailing: false,
              title: gift?.name ?? '-',
              subtitle: '${gift?.point ?? 0} Point',
              leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network('$kProductImageUrlConstant${gift?.img}',
                      width: size.width / 4.5)),
            ),
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                  child: OutlinedButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text('Batal'))),
              const SizedBox(width: 10),
              Expanded(
                  child: TextButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: const Text('Kirim Hadiah'))),
            ],
          )
        ],
      ),
    );
  }
}
