// ignore_for_file: strict_raw_type

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:keiko_good_day/core/use_case/use_case.dart';
import 'package:keiko_good_day/data/model/request/confirmation/confirmation_body.dart';
import 'package:keiko_good_day/domain/entity/cluster_entity.dart';
import 'package:keiko_good_day/domain/entity/confirmation_entity.dart';
import 'package:keiko_good_day/domain/entity/gift_entity.dart';
import 'package:keiko_good_day/domain/entity/product_entity.dart';
import 'package:keiko_good_day/domain/entity/rayons_entity.dart';
import 'package:keiko_good_day/domain/entity/shop_detail_entity.dart';
import 'package:keiko_good_day/domain/entity/shops_entity.dart';
import 'package:keiko_good_day/domain/entity/statistic_entity.dart';
import 'package:keiko_good_day/domain/use_case/master/get_cluster_usecase.dart';
import 'package:keiko_good_day/domain/use_case/master/get_cofirmation_usecase.dart';
import 'package:keiko_good_day/domain/use_case/master/get_gift_usecase.dart';
import 'package:keiko_good_day/domain/use_case/master/get_product_usecase.dart';
import 'package:keiko_good_day/domain/use_case/master/get_rayons_usecase.dart';
import 'package:keiko_good_day/domain/use_case/master/get_shop_detail_usecase.dart';
import 'package:keiko_good_day/domain/use_case/master/get_shops_usecase.dart';
import 'package:keiko_good_day/domain/use_case/master/get_statistic_usecase.dart';

part 'master_data_loader_event.dart';
part 'master_data_loader_state.dart';

class MasterDataLoaderBloc
    extends Bloc<MasterDataLoaderEvent, MasterDataLoaderState> {
  MasterDataLoaderBloc(
      this.statisticUseCase,
      this.clusterUseCase,
      this.rayonsUseCase,
      this.producUseCase,
      this.shopsUseCase,
      this.shopDetailUseCase,
      this.giftUseCase,
      this.confirmationUseCase)
      : super(MasterDataLoaderInitial()) {
    on<OnGetStatistic>(onGetStatisticEvent);
    on<OnGetClusterList>(onGetClusterList);
    on<OnGetRayonsList>(onGetRayonsList);
    on<OnRayonSearch>(onRayonSearch);
    on<OnGetProductList>(onGetProductList);
    on<OnGetShopList>(onGetShopList);
    on<OnGetShopDetail>(onGetShopDetail);
    on<OnGetGiftList>(onGetGiftList);
    on<OnShopSearch>(onShopSearch);
    on<OnGetConfirmationList>(onGetConfirmationList);
  }

  final GetStatisticUseCase statisticUseCase;
  final GetClusterUseCase clusterUseCase;
  final GetRayonsUseCase rayonsUseCase;
  final GetProducUseCase producUseCase;
  final GetShopsUseCase shopsUseCase;
  final GetShopDetailUseCase shopDetailUseCase;
  final GetGiftUseCase giftUseCase;
  final GetConfirmationUseCase confirmationUseCase;

  Future onGetStatisticEvent(
      OnGetStatistic event, Emitter<MasterDataLoaderState> emit) async {
    final result = await statisticUseCase.execute(NoParams());

    result.fold((l) {
      if (kDebugMode) {
        print('ERROR --> $l');
      }
    }, (r) {
      emit(state.copyWith(statisticEntity: r));
    });
  }

  Future onGetClusterList(
      OnGetClusterList event, Emitter<MasterDataLoaderState> emit) async {
    final result = await clusterUseCase.execute(NoParams());

    result.fold((l) {
      if (kDebugMode) {
        print('ERROR --> $l');
      }
    }, (r) {
      emit(state.copyWith(clusterEntity: r));
    });
  }

  Future onGetRayonsList(
      OnGetRayonsList event, Emitter<MasterDataLoaderState> emit) async {
    final result = await rayonsUseCase.execute(event.idCluster);

    result.fold((l) {
      if (kDebugMode) {
        print('ERROR ---> $l');
      }
    }, (r) {
      emit(state.copyWith(rayonsEntity: r));
    });
  }

  Future onRayonSearch(
      OnRayonSearch event, Emitter<MasterDataLoaderState> emit) async {
    final rayons = state.rayonsEntity;
    final result = <DataRayonEntity>[];
    for (final rayon in rayons!.dataRayons!) {
      if (rayon.name?.toLowerCase().contains(event.query.toLowerCase()) ??
          false) {
        result.add(rayon);
      }
    }

    emit(state.copyWith(rayonSearchResult: RayonsEntity(result)));
  }

  Future onGetProductList(
      OnGetProductList event, Emitter<MasterDataLoaderState> emit) async {
    final result = await producUseCase.execute(NoParams());
    result.fold((l) {
      if (kDebugMode) {
        print('Error ---> $l');
      }
    }, (r) => emit(state.copyWith(productEntity: r)));
  }

  Future onGetShopList(
      OnGetShopList event, Emitter<MasterDataLoaderState> emit) async {
    final result = await shopsUseCase.execute(event.idRayon);
    result.fold((l) {
      if (kDebugMode) {
        print('Error ---> $l');
      }
    }, (r) => emit(state.copyWith(shopEntity: r)));
  }

  Future onShopSearch(
      OnShopSearch event, Emitter<MasterDataLoaderState> emit) async {
    final shops = state.shopEntity;
    final result = <DataShopsEntity>[];

    for (final shop in shops!.shops!) {
      if (shop.name?.toLowerCase().contains(event.query.toLowerCase()) ??
          false) {
        result.add(shop);
      }
    }
    emit(state.copyWith(
        shopSearchEntity: ShopEntity(result, null), shopEntity: shops));
  }

  Future onGetShopDetail(
      OnGetShopDetail event, Emitter<MasterDataLoaderState> emit) async {
    final result = await shopDetailUseCase.execute(event.idShop);
    result.fold((l) {
      if (kDebugMode) {
        print('Error ---> $l');
      }
    }, (r) => emit(state.copyWith(shopDetailEntity: r)));
  }

  Future onGetGiftList(
      OnGetGiftList event, Emitter<MasterDataLoaderState> emit) async {
    final result = await giftUseCase.execute(NoParams());
    result.fold((l) {
      if (kDebugMode) {
        print('Error ---> $l');
      }
    }, (r) => emit(state.copyWith(giftEntity: r)));
  }

  Future onGetConfirmationList(
      OnGetConfirmationList event, Emitter<MasterDataLoaderState> emit) async {
    final result = await confirmationUseCase.execute(event.body);
    result.fold((l) {
      if (kDebugMode) {
        print('Error ---> $l');
      }
    }, (r) => emit(state.copyWith(confirmationEntity: r)));
  }
}
