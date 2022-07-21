import 'dart:io';

import 'package:flutter/material.dart';
import 'package:keiko_good_day/core/utils/image_picker.dart';
import 'package:keiko_good_day/presentation/widget/card/app_card.dart';

class ExchangePage extends StatefulWidget {
  const ExchangePage({Key? key}) : super(key: key);

  @override
  State<ExchangePage> createState() => _ExchangePageState();
}

class _ExchangePageState extends State<ExchangePage> {
  final takePicture = TakePicture();
  final filePicture = ValueNotifier<File?>(null);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView.separated(
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              takePicture.getPicture().then(onGetImage);
            },
            child: AppCard(
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      'https://media-cdn.tripadvisor.com/media/photo-s/1b/3f/c1/f1/kj-coffee-shop-es-un.jpg',
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
                          'Kedai Kopi Mantap',
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
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: 10);
  }

  Future<void> onGetImage(File? value) async {
    if (value != null && value.path.isNotEmpty) {
      return showModalBottomSheet(
          enableDrag: false,
          isDismissible: false,
          context: context,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8))),
          builder: (context) => PicturePreviewModal(pictureFile: value));
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
  const PicturePreviewModal({Key? key, required this.pictureFile})
      : super(key: key);

  final File pictureFile;

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
                  child:
                      TextButton(onPressed: () {}, child: const Text('Kirim'))),
            ],
          )
        ],
      ),
    );
  }
}
