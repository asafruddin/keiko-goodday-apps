import 'package:json_annotation/json_annotation.dart';
import 'package:keiko_good_day/data/model/response/shops/shops_model.dart';
import 'package:keiko_good_day/domain/entity/shop_detail_entity.dart';

part 'shop_detail_model.g.dart';

@JsonSerializable(explicitToJson: false, createToJson: false)
class ShopDetailModel extends ShopDetailEntity {
  ShopDetailModel({DataShopDetailModel? shop}) : super(shop);

  factory ShopDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ShopDetailModelFromJson(json);
}

@JsonSerializable(explicitToJson: false, createToJson: false)
class DataShopDetailModel extends DataShopDetailEntity {
  DataShopDetailModel(
      {int? id,
      int? branchId,
      int? motorisId,
      int? rayonId,
      String? code,
      String? name,
      String? address,
      String? telp,
      String? dateReg,
      String? img,
      String? lat,
      String? lang,
      String? point,
      String? description,
      String? status,
      int? isCreate,
      String? created,
      int? isUpdate,
      String? modified,
      int? isPrint,
      String? printed,
      String? isActive,
      String? isLog,
      DataRayonShopModel? rayon})
      : super(
            id,
            branchId,
            motorisId,
            rayonId,
            code,
            name,
            address,
            telp,
            dateReg,
            img,
            lat,
            lang,
            point,
            description,
            status,
            isCreate,
            created,
            isUpdate,
            modified,
            isPrint,
            printed,
            isActive,
            isLog,
            rayon);

  factory DataShopDetailModel.fromJson(Map<String, dynamic> json) =>
      _$DataShopDetailModelFromJson(json);
}
