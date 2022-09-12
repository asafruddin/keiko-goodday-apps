// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gift_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GiftModel _$GiftModelFromJson(Map<String, dynamic> json) => GiftModel(
      (json['gift'] as List<dynamic>?)
          ?.map((e) => DataGiftModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['pagination'] == null
          ? null
          : PaginatioModel.fromJson(json['pagination'] as Map<String, dynamic>),
    );

DataGiftModel _$DataGiftModelFromJson(Map<String, dynamic> json) =>
    DataGiftModel(
      json['id'] as int?,
      json['branch_id'] as int?,
      json['code'] as String?,
      json['name'] as String?,
      json['point'] as String?,
      json['description'] as String?,
      json['img'] as String?,
      json['unit'] as String?,
      json['type'] as String?,
      json['status'] as String?,
      json['is_create'] as int?,
      json['created'] as String?,
      json['is_update'] as int?,
      json['modified'] as String?,
      json['is_print'] as int?,
      json['printed'] as String?,
      json['is_active'] as String?,
      json['is_log'] as String?,
    );
