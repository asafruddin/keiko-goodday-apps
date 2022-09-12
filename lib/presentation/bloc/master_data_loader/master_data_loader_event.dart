part of 'master_data_loader_bloc.dart';

abstract class MasterDataLoaderEvent extends Equatable {
  const MasterDataLoaderEvent();

  @override
  List<Object> get props => [];
}

class OnGetStatistic extends MasterDataLoaderEvent {}

class OnGetClusterList extends MasterDataLoaderEvent {}

class OnGetRayonsList extends MasterDataLoaderEvent {
  const OnGetRayonsList(this.idCluster);
  final int idCluster;
}

class OnRayonSearch extends MasterDataLoaderEvent {
  const OnRayonSearch(this.query);
  final String query;
}

class OnGetProductList extends MasterDataLoaderEvent {}

class OnGetShopList extends MasterDataLoaderEvent {
  const OnGetShopList(this.idRayon);

  final int idRayon;
}

class OnGetShopDetail extends MasterDataLoaderEvent {
  const OnGetShopDetail(this.idShop);

  final int idShop;
}

class OnGetGiftList extends MasterDataLoaderEvent {}

class OnShopSearch extends MasterDataLoaderEvent {
  const OnShopSearch(this.query);

  final String query;
}

class OnGetConfirmationList extends MasterDataLoaderEvent {
  const OnGetConfirmationList(this.body);

  final ConfirmationBody body;
}
