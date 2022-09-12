// ignore_for_file: lines_longer_than_80_chars

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:keiko_good_day/core/injection/di.dart';
import 'package:keiko_good_day/core/local_storage/shared_preferences.dart';
import 'package:keiko_good_day/core/platform/current_location.dart';
import 'package:keiko_good_day/core/utils/constant/key_constant.dart';
import 'package:keiko_good_day/data/model/request/confirmation/picture_confirmation_body.dart';
import 'package:keiko_good_day/domain/entity/shop_detail_entity.dart';
import 'package:keiko_good_day/presentation/bloc/confirmation_picture/confirmation_picture_bloc.dart';
import 'package:keiko_good_day/presentation/view/shop/local_widget/picture_confirmation.dart';
import 'package:keiko_good_day/presentation/view/shop/summary_page.dart';
import 'package:keiko_good_day/presentation/widget/loader/loader_overlay.dart';

class ReportPicturePage extends StatefulWidget {
  const ReportPicturePage({Key? key, required this.shopDetail})
      : super(key: key);

  final ShopDetailEntity shopDetail;

  @override
  State<ReportPicturePage> createState() => _ReportPicturePageState();
}

class _ReportPicturePageState extends State<ReportPicturePage> {
  final confirmationBloc = sl<ConfirmationPictureBloc>();
  final _prefs = sl<SharedPrefs>();

  final address = ValueNotifier<String?>(null);
  final position = ValueNotifier<LatLng?>(null);

  final criteriaData = ValueNotifier<List<PictureConfirmationData>>(const [
    PictureConfirmationData(
        id: 0, category: 'Kondisi Pajangan Lengkap', point: 0),
    PictureConfirmationData(
        id: 1,
        category: 'Kondisi Branding Permanen Bagus dan Bersih',
        point: 0),
  ]);

  Future<void> getCurrentPosition() async {
    await CurrentLocation.getPosition().then((value) async {
      position.value = LatLng(value.latitude, value.longitude);
      await getAddress(LatLng(value.latitude, value.longitude));
    });
  }

  Future<void> getAddress(LatLng position) async {
    final addressResult =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    final administrativeArea = addressResult.first.administrativeArea ?? '';
    final locality = addressResult.first.locality ?? '';
    final street = addressResult.first.street ?? '';
    final subAdministrativeArea =
        addressResult.first.subAdministrativeArea ?? '';
    final subLocality = addressResult.first.subLocality ?? '';

    address.value =
        '$street, $subLocality, $locality, $subAdministrativeArea, $administrativeArea';
  }

  @override
  void initState() {
    super.initState();

    getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => confirmationBloc,
      child: BlocListener<ConfirmationPictureBloc, ConfirmationPictureState>(
        listener: (context, state) {
          if (state.failOrSuccess != null && !state.isSubmiting) {
            state.failOrSuccess!.fold(
                (l) => ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(l.message.toString()))), (r) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Berhasil mengkonfirmasi hadiah')));
              Future.delayed(const Duration(seconds: 3), () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute<dynamic>(
                        builder: (context) => SummaryPage(
                            shopId: widget.shopDetail.shop?.id,
                            criteriaData: criteriaData.value)));
              });
            });
          }
        },
        child: Scaffold(
            appBar: AppBar(title: const Text('Laporan')),
            body: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ValueListenableBuilder<String?>(
                        valueListenable: address,
                        builder: (context, value, child) {
                          return ListTile(
                            horizontalTitleGap: 5,
                            leading: const Icon(Icons.place_rounded),
                            trailing: InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(50),
                              child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 8),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Text('Sesuaikan',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary))),
                            ),
                            title: Text(value ?? '-',
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodyMedium),
                          );
                        }),
                    Expanded(
                      child: ListView.separated(
                        itemCount: criteriaData.value.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            const SizedBox(height: 10),
                        itemBuilder: (BuildContext context, int index) {
                          return PictureConfirmation(
                            criteriaData: criteriaData.value[index],
                            onGoodConditionChange: (value) {
                              final data = criteriaData.value.map((e) {
                                if (e.id == index) {
                                  return e.copyWith(point: value ? 100.0 : 0);
                                }
                                return e;
                              }).toList();

                              criteriaData.value = data;
                            },
                            onChangeImage: (value) {
                              final data = criteriaData.value.map((e) {
                                if (e.id == index) {
                                  return e.copyWith(imagePath: value?.path);
                                }
                                return e;
                              }).toList();

                              criteriaData.value = data;
                            },
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextButton(
                          onPressed: () {
                            final userId = _prefs.getInt(KeyConstant.keyUserId);
                            final body = PictureConfirmationBody(
                                date: DateFormat('yyyy-MM-dd')
                                    .format(DateTime.now()),
                                description: '',
                                latitude: position.value?.latitude.toString(),
                                longitude: position.value?.longitude.toString(),
                                shopId: widget.shopDetail.shop?.id,
                                motorisId: userId,
                                img1: criteriaData.value.first.imagePath,
                                img2: criteriaData.value.last.imagePath,
                                point1: criteriaData.value.first.point,
                                point2: criteriaData.value.last.point);
                            confirmationBloc.add(OnConfirmVisitShop(body));
                          },
                          child: const Text('Simpan')),
                    ),
                    const SizedBox(height: 20)
                  ],
                ),
                BlocBuilder<ConfirmationPictureBloc, ConfirmationPictureState>(
                  builder: (context, state) {
                    if (state.isSubmiting) {
                      return const LoaderOverlay();
                    }
                    return const SizedBox.shrink();
                  },
                )
              ],
            )),
      ),
    );
  }
}

class PictureConfirmationData extends Equatable {
  const PictureConfirmationData(
      {this.category, this.imagePath, this.point, this.id});

  final int? id;
  final String? category;
  final String? imagePath;
  final double? point;

  PictureConfirmationData copyWith({String? imagePath, double? point}) {
    return PictureConfirmationData(
        id: id,
        category: category,
        imagePath: imagePath ?? this.imagePath,
        point: point ?? this.point);
  }

  @override
  List<Object?> get props => [category, imagePath, point];
}
