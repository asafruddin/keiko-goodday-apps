import 'package:flutter/material.dart';
import 'package:keiko_good_day/presentation/view/confirmation/local_widget/confirmation_content.dart';
import 'package:keiko_good_day/presentation/widget/card/app_card.dart';

class ConfirmationPage extends StatefulWidget {
  const ConfirmationPage({Key? key}) : super(key: key);

  @override
  State<ConfirmationPage> createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  final startDate = ValueNotifier<DateTimeRange?>(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Konfirmasi'), actions: [
          IconButton(
              onPressed: onFilterTap,
              icon: const Icon(Icons.filter_alt_outlined))
        ]),
        body: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            itemBuilder: (context, index) {
              return const AppCard(
                child: ConfirmationContent(),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemCount: 10));
  }

  void onFilterTap() {
    showDateRangePicker(
            context: context,
            firstDate: DateTime.now().subtract(const Duration(days: 365)),
            lastDate: DateTime.now())
        .then((value) {
      startDate.value = value;
    });
  }
}
