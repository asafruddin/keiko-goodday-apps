import 'dart:io';

import 'package:flutter/material.dart';
import 'package:keiko_good_day/core/utils/image_picker.dart';
import 'package:keiko_good_day/presentation/widget/card/app_card.dart';

class PictureConfirmation extends StatefulWidget {
  const PictureConfirmation({
    Key? key,
  }) : super(key: key);

  @override
  State<PictureConfirmation> createState() => _PictureConfirmationState();
}

class _PictureConfirmationState extends State<PictureConfirmation> {
  final takePicture = TakePicture();

  final filePicture = ValueNotifier<File?>(null);

  @override
  Widget build(BuildContext context) {
    return AppCard(
      borderRadius: BorderRadius.circular(0),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Checkbox(value: true, onChanged: (value) {}),
            Expanded(
                child: Text('Kerapian cafe',
                    style: Theme.of(context).textTheme.headline6)),
            InkWell(
              onTap: () {
                takePicture.getPicture().then((value) {
                  filePicture.value = File(value.path);
                });
              },
              child: Icon(Icons.camera_alt_rounded,
                  color: Theme.of(context).colorScheme.primary),
            )
          ]),
          ValueListenableBuilder<File?>(
              valueListenable: filePicture,
              builder: (context, value, child) {
                if (value != null) {
                  return Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Image.file(value, height: 100),
                      Positioned(
                          top: -10,
                          right: -10,
                          child: InkWell(
                              onTap: () {
                                filePicture.value = null;
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      shape: BoxShape.circle),
                                  child: Icon(Icons.close,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary))))
                    ],
                  );
                }
                return const SizedBox();
              })
        ],
      ),
    );
  }
}
