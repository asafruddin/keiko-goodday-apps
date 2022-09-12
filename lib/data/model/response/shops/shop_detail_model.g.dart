// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopDetailModel _$ShopDetailModelFromJson(Map<String, dynamic> json) =>
    ShopDetailModel(
      shop: json['shop'] == null
          ? null
          : DataShopDetailModel.fromJson(json['shop'] as Map<String, dynamic>),
    );

DataShopDetailModel _$DataShopDetailModelFromJson(Map<String, dynamic> json) =>
    DataShopDetailModel(
      id: json['id'] as int?,
      branchId: json['branch_id'] as int?,
      motorisId: json['motoris_id'] as int?,
      rayonId: json['rayon_id'] as int?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      address: json['address'] as String?,
      telp: json['telp'] as String?,
      dateReg: json['date_reg'] as String?,
      img: json['img'] as String?,
      lat: json['lat'] as String?,
      lang: json['lang'] as String?,
      point: json['point'] as String?,
      description: json['description'] as String?,
      status: json['status'] as String?,
      isCreate: json['is_create'] as int?,
      created: json['created'] as String?,
      isUpdate: json['is_update'] as int?,
      modified: json['modified'] as String?,
      isPrint: json['is_print'] as int?,
      printed: json['printed'] as String?,
      isActive: json['is_active'] as String?,
      isLog: json['is_log'] as String?,
      rayon: json['rayon'] == null
          ? null
          : DataRayonShopModel.fromJson(json['rayon'] as Map<String, dynamic>),
    );
