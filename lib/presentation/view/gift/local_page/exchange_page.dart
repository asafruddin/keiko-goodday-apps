import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keiko_good_day/core/injection/di.dart';
import 'package:keiko_good_day/core/local_storage/shared_preferences.dart';
import 'package:keiko_good_day/core/utils/constant/key_constant.dart';
import 'package:keiko_good_day/core/utils/constant/url_constant.dart';
import 'package:keiko_good_day/core/utils/image_picker.dart';
import 'package:keiko_good_day/data/model/request/redeem_gift/confirm_redeem_gift_body.dart';
import 'package:keiko_good_day/domain/entity/redeem_gift_history.dart';
import 'package:keiko_good_day/presentation/bloc/confirmation_picture/confirmation_picture_bloc.dart';
import 'package:keiko_good_day/presentation/bloc/product/product_bloc.dart';
import 'package:keiko_good_day/presentation/widget/card/app_card.dart';
import 'package:keiko_good_day/presentation/widget/loader/loader_overlay.dart';

class ExchangePage extends StatefulWidget {
  const ExchangePage({Key? key}) : super(key: key);

  @override
  State<ExchangePage> createState() => _ExchangePageState();
}

class _ExchangePageState extends State<ExchangePage> {
  final takePicture = TakePicture();
  final filePicture = ValueNotifier<File?>(null);

  final _productBloc = sl<ProductBloc>();
  final _confirmBloc = sl<ConfirmationPictureBloc>();
  final _prefs = sl<SharedPrefs>();

  @override
  void initState() {
    super.initState();
    final userId = _prefs.getInt(KeyConstant.keyUserId);
    _productBloc.add(OnGetRedeemGiftHistory(userId!));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => _productBloc),
        BlocProvider(create: (context) => _confirmBloc),
      ],
      child: BlocListener<ConfirmationPictureBloc, ConfirmationPictureState>(
        listener: (context, state) {
          if (state.failOrSuccess != null && !state.isSubmiting) {
            state.failOrSuccess!.fold(
                (l) => ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(l.message.toString()))), (r) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Berhasil mengkonfirmasi hadiah')));
              final userId = _prefs.getInt(KeyConstant.keyUserId);
              _productBloc.add(OnGetRedeemGiftHistory(userId!));
            });
          }
        },
        child: Stack(
          children: [
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                return ListView.separated(
                    itemBuilder: (context, index) {
                      final history =
                          state.giftHistoryEntity?.redeemPoints?[index];
                      return InkWell(
                        onTap: () {
                          takePicture
                              .getPicture()
                              .then((value) => onGetImage(value, history!));
                        },
                        child: AppCard(
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: history?.shop?.img == null
                                    ? Image.network(
                                        kImagePlaceholder,
                                        height: size.width / 4.5,
                                        fit: BoxFit.fitHeight,
                                      )
                                    : Image.network(
                                        '$kShopImageUrlConstant${history?.shop?.img}',
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
                                      history?.shop?.name ?? '',
                                      maxLines: 1,
                                      style:
                                          Theme.of(context).textTheme.subtitle2,
                                    ),
                                    const Divider(height: 8),
                                    Text(
                                      history?.shop?.address ?? '',
                                      maxLines: 2,
                                      style:
                                          Theme.of(context).textTheme.caption,
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      'Penukaran : ${history?.item?.name ?? '-'}',
                                      maxLines: 1,
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
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
                    itemCount:
                        state.giftHistoryEntity?.redeemPoints?.length ?? 0);
              },
            ),
            BlocBuilder<ConfirmationPictureBloc, ConfirmationPictureState>(
                builder: (context, state) {
              if (state.isSubmiting) {
                return LoaderOverlay();
              }
              return const SizedBox.shrink();
            })
          ],
        ),
      ),
    );
  }

  Future<void> onGetImage(File? value, RedeemPointsEntity history) async {
    if (value != null && value.path.isNotEmpty) {
      return showModalBottomSheet(
          enableDrag: false,
          isDismissible: false,
          context: context,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8))),
          builder: (context) => PicturePreviewModal(
                pictureFile: value,
                onPress: () {
                  Navigator.maybePop(context).then((_) {
                    final body = ConfirmRedeemGiftBody(
                        historyId: history.id,
                        motorisId: history.motorisId,
                        img: value.path);
                    _confirmBloc.add(OnConfirmaRedeemGift(body));
                  });
                },
              ));
    } else {
      final snackBar = SnackBar(
        content: const Text('Tidak dapat mengambil gambar'),
        duration: const Duration(milliseconds: 1500),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}

class PicturePreviewModal extends StatelessWidget {
  const PicturePreviewModal({Key? key, required this.pictureFile, this.onPress})
      : super(key: key);

  final File pictureFile;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Konfirmasi Hadiah',
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Center(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(pictureFile, height: size.height / 3)),
                Positioned(
                    right: -10,
                    top: -10,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).colorScheme.primary),
                        child: Icon(Icons.autorenew,
                            color: Theme.of(context).colorScheme.onSecondary),
                      ),
                    ))
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                  child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Batal'))),
              const SizedBox(width: 16),
              Expanded(
                  child: TextButton(
                      onPressed: onPress, child: const Text('Kirim'))),
            ],
          )
        ],
      ),
    );
  }
}
