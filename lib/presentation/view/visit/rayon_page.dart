import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keiko_good_day/core/injection/di.dart';
import 'package:keiko_good_day/domain/entity/rayons_entity.dart';
import 'package:keiko_good_day/presentation/bloc/master_data_loader/master_data_loader_bloc.dart';
import 'package:keiko_good_day/presentation/view/shop/shop_list.dart';
import 'package:keiko_good_day/presentation/widget/card/app_card.dart';
import 'package:keiko_good_day/presentation/widget/card/card_list_content.dart';
import 'package:keiko_good_day/presentation/widget/search_bar/search_filter_bar.dart';

class RayonPage extends StatefulWidget {
  const RayonPage({Key? key, this.isFromGift = false, this.idCluster})
      : super(key: key);

  final bool isFromGift;
  final int? idCluster;

  @override
  State<RayonPage> createState() => _RayonPageState();
}

class _RayonPageState extends State<RayonPage> {
  final rayonsListBloc = sl<MasterDataLoaderBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchFilterBar(
          label: 'Daftar Rayon',
          isFilter: false,
          onSearchChanged: (p0) => rayonsListBloc.add(OnRayonSearch(p0)),
        ),
      ),
      body: BlocProvider(
        create: (context) =>
            rayonsListBloc..add(OnGetRayonsList(widget.idCluster!)),
        child: BlocBuilder<MasterDataLoaderBloc, MasterDataLoaderState>(
          builder: (context, state) {
            var list = <DataRayonEntity>[];
            if (state.rayonSearchResult?.dataRayons?.isNotEmpty ?? false) {
              list = state.rayonSearchResult?.dataRayons ?? [];
            } else {
              list = state.rayonsEntity?.dataRayons ?? [];
            }
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.errorMsg != null) {
              return Center(
                child: Text(
                  state.errorMsg ?? 'Terjadi Kesalahan',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              );
            }
            if (list.isEmpty) {
              return Center(
                child: Text(
                  'Data Rayon Kosong',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              );
            }
            return ListView.separated(
                itemBuilder: (context, index) {
                  final rayon = list[index];
                  return AppCard(
                    onPress: () {
                      Navigator.push<dynamic>(
                          context,
                          MaterialPageRoute<dynamic>(
                            builder: (context) => ShopList(
                                isFromGift: widget.isFromGift,
                                idRayons: rayon.id!),
                          ));
                    },
                    child: CardListContent(
                      subtitle: '${rayon.totalKedai ?? 0} Kedai',
                      title: rayon.name ?? '',
                      leading: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Theme.of(context)
                                .primaryColor
                                .withOpacity(0.1)),
                        child: Icon(
                          Icons.share,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemCount: list.length);
          },
        ),
      ),
    );
  }
}
