import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:keiko_good_day/core/exceptions/failure.dart';
import 'package:keiko_good_day/data/datasource/master_datasource.dart';
import 'package:keiko_good_day/data/model/request/confirmation/confirmation_body.dart';
import 'package:keiko_good_day/domain/entity/cluster_entity.dart';
import 'package:keiko_good_day/domain/entity/confirmation_entity.dart';
import 'package:keiko_good_day/domain/entity/gift_entity.dart';
import 'package:keiko_good_day/domain/entity/product_entity.dart';
import 'package:keiko_good_day/domain/entity/rayons_entity.dart';
import 'package:keiko_good_day/domain/entity/shop_detail_entity.dart';
import 'package:keiko_good_day/domain/entity/shops_entity.dart';
import 'package:keiko_good_day/domain/entity/statistic_entity.dart';
import 'package:keiko_good_day/domain/repository/master_repository.dart';

class MasterRepoImpl extends MasterRepository {
  MasterRepoImpl(this.masterSource);

  final MasterDatasource? masterSource;
  @override
  Future<Either<Failure, StatisticEntity>> getStatistic() async {
    try {
      return masterSource!.getStatistic().then(right);
    } on DioError catch (e) {
      final failure = ServerFailure(message: e.message);
      return left(failure);
    } catch (e) {
      return left(AnotherFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ClusterEntity>> getClusterList() async {
    try {
      return masterSource!.getClusterList().then(right);
    } on DioError catch (e) {
      final failure = ServerFailure(message: e.message);
      return left(failure);
    } catch (e) {
      return left(AnotherFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, RayonsEntity>> getRayonsList(int idCluster) async {
    try {
      return masterSource!.getRayonsList(idCluster).then(right);
    } on DioError catch (e) {
      final failure = ServerFailure(message: e.message);
      return left(failure);
    } catch (e) {
      return left(AnotherFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ShopEntity>> getShopsList(int idRayons) async {
    try {
      return masterSource!.getShopsList(idRayons).then(right);
    } on DioError catch (e) {
      final failure = ServerFailure(message: e.message);
      return left(failure);
    } catch (e) {
      return left(AnotherFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, GiftEntity>> getGiftList() async {
    try {
      return masterSource!.getGiftList().then(right);
    } on DioError catch (e) {
      final failure = ServerFailure(message: e.message);
      return left(failure);
    } catch (e) {
      return left(AnotherFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> getProductList() async {
    try {
      return masterSource!.getProductList().then(right);
    } on DioError catch (e) {
      final failure = ServerFailure(message: e.message);
      return left(failure);
    } catch (e) {
      return left(AnotherFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ConfirmationEntity>> getConfirmation(
      ConfirmationBody body) async {
    try {
      return masterSource!.getConfirmation(body).then(right);
    } on DioError catch (e) {
      final failure = ServerFailure(message: e.message);
      return left(failure);
    } catch (e) {
      return left(AnotherFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ShopDetailEntity>> getShopDetail(int idShops) async {
    try {
      return masterSource!.getShopDetail(idShops).then(right);
    } on DioError catch (e) {
      final failure = ServerFailure(message: e.message);
      return left(failure);
    } catch (e) {
      return left(AnotherFailure(e.toString()));
    }
  }
}
