// ignore_for_file: inference_failure_on_function_return_type

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:keiko_good_day/core/utils/image_picker.dart';
import 'package:keiko_good_day/presentation/view/shop/report_picture_page.dart';
import 'package:keiko_good_day/presentation/widget/card/app_card.dart';

class PictureConfirmation extends StatefulWidget {
  const PictureConfirmation(
      {Key? key,
      required this.criteriaData,
      required this.onChangeImage,
      required this.onGoodConditionChange})
      : super(key: key);

  final PictureConfirmationData criteriaData;
  final Function(File? value) onChangeImage;
  final Function(bool value) onGoodConditionChange;

  @override
  State<PictureConfirmation> createState() => _PictureConfirmationState();
}

class _PictureConfirmationState extends State<PictureConfirmation> {
  final takePicture = TakePicture();

  final filePicture = ValueNotifier<File?>(null);
  final goodCondition = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return AppCard(
      borderRadius: BorderRadius.circular(0),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
                child: Text(widget.criteriaData.category ?? '',
                    style: Theme.of(context).textTheme.headline6)),
            InkWell(
              onTap: () {
                takePicture.getPicture().then((value) {
                  filePicture.value = File(value.path);
                  widget.onChangeImage(value);
                });
              },
              child: Column(
                children: [
                  Icon(Icons.camera_alt_rounded,
                      color: Theme.of(context).colorScheme.primary),
                  ValueListenableBuilder<bool>(
                      valueListenable: goodCondition,
                      builder: (context, value, child) {
                        return OutlinedButton(
                            style: ButtonStyle(
                                foregroundColor: MaterialStateProperty.all(value
                                    ? Theme.of(context).colorScheme.onPrimary
                                    : null),
                                backgroundColor: MaterialStateProperty.all(value
                                    ? Theme.of(context).colorScheme.primary
                                    : null),
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.all(8))),
                            onPressed: () {
                              goodCondition.value = !value;
                              widget.onGoodConditionChange(!value);
                            },
                            child: const Text('Kondisi Bagus'));
                      })
                ],
              ),
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
                                widget.onChangeImage(null);
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
