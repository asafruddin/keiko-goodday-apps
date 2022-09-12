import 'package:dartz/dartz.dart';
import 'package:keiko_good_day/core/exceptions/failure.dart';
import 'package:keiko_good_day/data/model/request/confirmation/confirmation_body.dart';
import 'package:keiko_good_day/domain/entity/cluster_entity.dart';
import 'package:keiko_good_day/domain/entity/confirmation_entity.dart';
import 'package:keiko_good_day/domain/entity/gift_entity.dart';
import 'package:keiko_good_day/domain/entity/product_entity.dart';
import 'package:keiko_good_day/domain/entity/rayons_entity.dart';
import 'package:keiko_good_day/domain/entity/shop_detail_entity.dart';
import 'package:keiko_good_day/domain/entity/shops_entity.dart';
import 'package:keiko_good_day/domain/entity/statistic_entity.dart';

abstract class MasterRepository {
  Future<Either<Failure, StatisticEntity>> getStatistic();
  Future<Either<Failure, ClusterEntity>> getClusterList();
  Future<Either<Failure, RayonsEntity>> getRayonsList(int idCluster);
  Future<Either<Failure, ShopEntity>> getShopsList(int idRayons);
  Future<Either<Failure, GiftEntity>> getGiftList();
  Future<Either<Failure, ProductEntity>> getProductList();
  Future<Either<Failure, ConfirmationEntity>> getConfirmation(
      ConfirmationBody body);
  Future<Either<Failure, ShopDetailEntity>> getShopDetail(int idShops);
}
