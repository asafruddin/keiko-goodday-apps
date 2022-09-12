import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:keiko_good_day/core/injection/di.dart';
import 'package:keiko_good_day/core/local_storage/shared_preferences.dart';
import 'package:keiko_good_day/core/utils/constant/key_constant.dart';
import 'package:keiko_good_day/data/model/request/confirmation/confirmation_body.dart';
import 'package:keiko_good_day/presentation/bloc/master_data_loader/master_data_loader_bloc.dart';
import 'package:keiko_good_day/presentation/view/confirmation/local_widget/confirmation_content.dart';
import 'package:keiko_good_day/presentation/view/shop/report_picture_page.dart';
import 'package:keiko_good_day/presentation/view/shop/summary_page.dart';
import 'package:keiko_good_day/presentation/widget/card/app_card.dart';

class ConfirmationPage extends StatefulWidget {
  const ConfirmationPage({Key? key}) : super(key: key);

  @override
  State<ConfirmationPage> createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  final masterBloc = sl<MasterDataLoaderBloc>();
  final _prefs = sl<SharedPrefs>();

  final dateRange = ValueNotifier<DateTimeRange?>(
      DateTimeRange(start: DateTime.now(), end: DateTime.now()));
  final userId = ValueNotifier<int?>(null);

  @override
  void initState() {
    super.initState();
    userId.value = _prefs.getInt(KeyConstant.keyUserId);
    masterBloc.add(OnGetConfirmationList(ConfirmationBody(
        motorisId: userId.value,
        start: DateFormat('yyyy-MM-dd').format(dateRange.value!.start),
        end: DateFormat('yyyy-MM-dd').format(dateRange.value!.end))));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => masterBloc,
      child: Scaffold(
          appBar: AppBar(title: const Text('Konfirmasi'), actions: [
            IconButton(
                onPressed: onFilterTap,
                icon: const Icon(Icons.filter_alt_outlined))
          ]),
          body: BlocBuilder<MasterDataLoaderBloc, MasterDataLoaderState>(
            builder: (context, state) {
              final confirmations = state.confirmationEntity?.confirm;
              if (confirmations?.isEmpty ?? true) {
                return const Center(child: Text('Tidak ada data konfirmasi'));
              }
              return ListView.separated(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                  itemBuilder: (context, index) {
                    final confirmation = confirmations?[index];
                    final criteriaData = [
                      PictureConfirmationData(
                          id: 0,
                          category: 'Kondisi Pajangan Lengkap',
                          point: double.parse(confirmation?.point1 ?? '0')),
                      PictureConfirmationData(
                          id: 1,
                          category:
                              'Kondisi Branding Permanen Bagus dan Bersih',
                          point: double.parse(confirmation?.point2 ?? '0')),
                    ];

                    return AppCard(
                      onPress: () => Navigator.push<dynamic>(
                          context,
                          MaterialPageRoute<dynamic>(
                              builder: (context) => SummaryPage(
                                  criteriaData: criteriaData,
                                  shopId: confirmation?.shopId))),
                      child: ConfirmationContent(confirmation: confirmation),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 8),
                  itemCount: confirmations?.length ?? 0);
            },
          )),
    );
  }

  void onFilterTap() {
    showDateRangePicker(
            context: context,
            firstDate: DateTime.now().subtract(const Duration(days: 365)),
            lastDate: DateTime.now())
        .then((value) {
      dateRange.value = value;
      masterBloc.add(OnGetConfirmationList(ConfirmationBody(
          motorisId: userId.value,
          start: DateFormat('yyyy-MM-dd').format(dateRange.value!.start),
          end: DateFormat('yyyy-MM-dd').format(dateRange.value!.end))));
    });
  }
}
