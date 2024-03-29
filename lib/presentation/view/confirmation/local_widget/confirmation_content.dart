import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:keiko_good_day/domain/entity/confirmation_entity.dart';

class ConfirmationContent extends StatelessWidget {
  const ConfirmationContent({Key? key, this.confirmation}) : super(key: key);

  final DataConfirmationEntity? confirmation;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(confirmation?.shop?.name ?? '',
            style: Theme.of(context).textTheme.headline6),
        const SizedBox(height: 16),
        DetailContent(
            title: 'Point', data: confirmation?.shop?.point.toString()),
        DetailContent(
            title: 'Tanggal',
            data: confirmation?.date == null
                ? ''
                : DateFormat('EE, dd MMM yyyy').format(
                    DateTime.tryParse(confirmation?.date ?? '') ??
                        DateTime.now())),
      ],
    );
  }
}

class DetailContent extends StatelessWidget {
  const DetailContent({
    Key? key,
    this.title,
    this.data,
  }) : super(key: key);

  final String? title;
  final String? data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title ?? '',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          Text(
            data ?? '',
            style: Theme.of(context).textTheme.subtitle2,
          )
        ],
      ),
    );
  }
}
