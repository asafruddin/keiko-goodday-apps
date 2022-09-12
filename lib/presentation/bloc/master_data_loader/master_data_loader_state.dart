part of 'master_data_loader_bloc.dart';

class MasterDataLoaderState extends Equatable {
  const MasterDataLoaderState(
      {this.statisticEntity,
      this.clusterEntity,
      this.rayonsEntity,
      this.rayonSearchResult,
      this.productEntity,
      this.shopEntity,
      this.shopDetailEntity,
      this.shopSearchEntity,
      this.giftEntity,
      this.confirmationEntity});

  final StatisticEntity? statisticEntity;
  final ClusterEntity? clusterEntity;
  final RayonsEntity? rayonsEntity;
  final RayonsEntity? rayonSearchResult;
  final ProductEntity? productEntity;
  final ShopEntity? shopEntity;
  final ShopEntity? shopSearchEntity;
  final ShopDetailEntity? shopDetailEntity;
  final GiftEntity? giftEntity;
  final ConfirmationEntity? confirmationEntity;

  MasterDataLoaderState copyWith(
      {StatisticEntity? statisticEntity,
      ClusterEntity? clusterEntity,
      RayonsEntity? rayonsEntity,
      RayonsEntity? rayonSearchResult,
      ProductEntity? productEntity,
      ShopEntity? shopEntity,
      ShopDetailEntity? shopDetailEntity,
      GiftEntity? giftEntity,
      ShopEntity? shopSearchEntity,
      ConfirmationEntity? confirmationEntity}) {
    return MasterDataLoaderState(
        statisticEntity: statisticEntity ?? this.statisticEntity,
        clusterEntity: clusterEntity ?? this.clusterEntity,
        rayonsEntity: rayonsEntity ?? this.rayonsEntity,
        rayonSearchResult: rayonSearchResult ?? this.rayonSearchResult,
        productEntity: productEntity ?? this.productEntity,
        shopEntity: shopEntity,
        shopDetailEntity: shopDetailEntity ?? this.shopDetailEntity,
        giftEntity: giftEntity ?? this.giftEntity,
        shopSearchEntity: shopSearchEntity ?? this.shopSearchEntity,
        confirmationEntity: confirmationEntity ?? this.confirmationEntity);
  }

  @override
  List<Object?> get props => [
        statisticEntity,
        clusterEntity,
        rayonSearchResult,
        rayonsEntity,
        productEntity,
        shopEntity,
        shopDetailEntity,
        giftEntity,
        shopSearchEntity,
        confirmationEntity
      ];
}

class MasterDataLoaderInitial extends MasterDataLoaderState {}
