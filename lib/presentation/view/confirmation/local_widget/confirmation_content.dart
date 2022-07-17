import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ConfirmationContent extends StatelessWidget {
  const ConfirmationContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Kedai Kopi Mantap', style: Theme.of(context).textTheme.headline6),
        const SizedBox(height: 16),
        const DetailContent(title: 'Point', data: '902384'),
        DetailContent(
            title: 'Tanggal',
            data: DateFormat('EE, dd MMM yyyy').format(DateTime.now())),
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
