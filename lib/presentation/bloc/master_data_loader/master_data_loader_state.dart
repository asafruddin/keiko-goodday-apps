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
      this.confirmationEntity,
      this.errorMsg,
      this.isLoading = false});

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
  final bool isLoading;
  final String? errorMsg;

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
      ConfirmationEntity? confirmationEntity,
      bool? isLoading,
      String? errorMsg}) {
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
        confirmationEntity: confirmationEntity ?? this.confirmationEntity,
        errorMsg: errorMsg ?? this.errorMsg,
        isLoading: isLoading ?? this.isLoading);
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
        confirmationEntity,
        isLoading,
        errorMsg
      ];
}

class MasterDataLoaderInitial extends MasterDataLoaderState {}
