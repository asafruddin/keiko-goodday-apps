import 'package:dio/dio.dart';
import 'package:keiko_good_day/data/model/request/confirmation/confirmation_body.dart';
import 'package:keiko_good_day/data/model/response/cluster/cluster_model.dart';
import 'package:keiko_good_day/data/model/response/confirmation/confirmation_model.dart';
import 'package:keiko_good_day/data/model/response/gift/gift_model.dart';
import 'package:keiko_good_day/data/model/response/products/product_model.dart';
import 'package:keiko_good_day/data/model/response/rayons/rayons_model.dart';
import 'package:keiko_good_day/data/model/response/shops/shop_detail_model.dart';
import 'package:keiko_good_day/data/model/response/shops/shops_model.dart';
import 'package:keiko_good_day/data/model/response/statistics/statistic_model.dart';
import 'package:keiko_good_day/domain/entity/cluster_entity.dart';
import 'package:keiko_good_day/domain/entity/confirmation_entity.dart';
import 'package:keiko_good_day/domain/entity/gift_entity.dart';
import 'package:keiko_good_day/domain/entity/product_entity.dart';
import 'package:keiko_good_day/domain/entity/rayons_entity.dart';
import 'package:keiko_good_day/domain/entity/shop_detail_entity.dart';
import 'package:keiko_good_day/domain/entity/shops_entity.dart';
import 'package:keiko_good_day/domain/entity/statistic_entity.dart';

abstract class MasterDatasource {
  Future<StatisticEntity> getStatistic();
  Future<ClusterEntity> getClusterList();
  Future<RayonsEntity> getRayonsList(int idCluster);
  Future<ShopEntity> getShopsList(int idRayon);
  Future<ShopDetailEntity> getShopDetail(int idShop);
  Future<GiftEntity> getGiftList();
  Future<ProductEntity> getProductList();
  Future<ConfirmationEntity> getConfirmation(ConfirmationBody body);
}

class MasterDataSourceImpl implements MasterDatasource {
  MasterDataSourceImpl(this._dio);

  final Dio _dio;
  @override
  Future<StatisticEntity> getStatistic() async {
    final response = await _dio.get<dynamic>('/dashboard/dashboard');
    return StatisticModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<ClusterEntity> getClusterList() async {
    final response = await _dio.get<dynamic>('/clusters/list');
    return ClusterModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<RayonsEntity> getRayonsList(int idCluster) async {
    final response = await _dio.get<dynamic>('/rayons/list/$idCluster');
    return RayonsModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<ShopEntity> getShopsList(int idRayon) async {
    final response = await _dio.get<dynamic>('/shops/list/$idRayon');
    return ShopsModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<GiftEntity> getGiftList() async {
    final response = await _dio.get<dynamic>('/items/gift');
    return GiftModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<ProductEntity> getProductList() async {
    final response = await _dio.get<dynamic>('/items/products');
    return ProductModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<ConfirmationEntity> getConfirmation(ConfirmationBody body) async {
    final response = await _dio.get<dynamic>(
        '/receive-shops /confirm/${body.motorisId}',
        queryParameters: body.toJson());
    return ConfirmationModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<ShopDetailEntity> getShopDetail(int idShop) async {
    final response = await _dio.get<dynamic>('/shops/view/$idShop');
    return ShopDetailModel.fromJson(response.data as Map<String, dynamic>);
  }
}
