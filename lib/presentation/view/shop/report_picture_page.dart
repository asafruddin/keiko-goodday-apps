// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:keiko_good_day/core/platform/current_location.dart';
import 'package:keiko_good_day/presentation/view/shop/local_widget/picture_confirmation.dart';
import 'package:keiko_good_day/presentation/view/shop/summary_page.dart';

class ReportPicturePage extends StatefulWidget {
  const ReportPicturePage({Key? key}) : super(key: key);

  @override
  State<ReportPicturePage> createState() => _ReportPicturePageState();
}

class _ReportPicturePageState extends State<ReportPicturePage> {
  final address = ValueNotifier<String?>(null);
  final position = ValueNotifier<LatLng?>(null);

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
    return Scaffold(
        appBar: AppBar(title: const Text('Laporan')),
        body: Column(
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
                                  color: Theme.of(context).colorScheme.primary),
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
                itemCount: 5,
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(height: 10),
                itemBuilder: (BuildContext context, int index) {
                  return const PictureConfirmation();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextButton(
                  onPressed: () => Navigator.push<dynamic>(
                      context,
                      MaterialPageRoute<dynamic>(
                          builder: (context) => const SummaryPage())),
                  child: const Text('Simpan')),
            ),
            const SizedBox(height: 20)
          ],
        ));
  }
}
