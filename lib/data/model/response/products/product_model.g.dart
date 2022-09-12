// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => DataProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : PaginatioModel.fromJson(json['pagination'] as Map<String, dynamic>),
    );

DataProductModel _$DataProductModelFromJson(Map<String, dynamic> json) =>
    DataProductModel(
      id: json['id'] as int?,
      branchId: json['branch_id'] as int?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      point: json['point'] as String?,
      description: json['description'] as String?,
      img: json['img'] as String?,
      unit: json['unit'] as String?,
      type: json['type'] as String?,
      status: json['status'] as String?,
      isCreate: json['is_create'] as int?,
      created: json['created'] as String?,
      isUpdate: json['is_update'] as int?,
      modified: json['modified'] as String?,
      isPrint: json['is_print'] as int?,
      printed: json['printed'] as bool?,
      isActive: json['is_active'] as String?,
      isLog: json['is_log'] as String?,
    );
