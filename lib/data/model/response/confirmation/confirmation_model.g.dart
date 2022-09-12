// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirmation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfirmationModel _$ConfirmationModelFromJson(Map<String, dynamic> json) =>
    ConfirmationModel(
      confirm: (json['confirm'] as List<dynamic>?)
          ?.map(
              (e) => DataConfirmationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : PaginatioModel.fromJson(json['pagination'] as Map<String, dynamic>),
    );

DataConfirmationModel _$DataConfirmationModelFromJson(
        Map<String, dynamic> json) =>
    DataConfirmationModel(
      id: json['id'] as int?,
      shopId: json['shop_id'] as int?,
      motorisId: json['motoris_id'] as int?,
      code: json['code'] as String?,
      date: json['date'] as String?,
      img1: json['img1'] as String?,
      img2: json['img2'] as String?,
      img3: json['img3'] as String?,
      point1: json['point1'] as String?,
      point2: json['point2'] as String?,
      point3: json['point3'] as String?,
      description: json['description'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      status: json['status'] as String?,
      isCreate: json['is_create'] as int?,
      created: json['created'] as String?,
      isUpdate: json['is_update'] as int?,
      modified: json['modified'] as String?,
      isPrint: json['is_print'] as int?,
      printed: json['printed'] as String?,
      isActive: json['is_active'] as String?,
      isLog: json['is_log'] as String?,
      shop: json['shop'] == null
          ? null
          : DataShopModel.fromJson(json['shop'] as Map<String, dynamic>),
    );
