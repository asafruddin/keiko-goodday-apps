// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shops_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopsModel _$ShopsModelFromJson(Map<String, dynamic> json) => ShopsModel(
      shops: (json['shops'] as List<dynamic>?)
          ?.map((e) => DataShopModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : PaginatioModel.fromJson(json['pagination'] as Map<String, dynamic>),
    );

DataShopModel _$DataShopModelFromJson(Map<String, dynamic> json) =>
    DataShopModel(
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

DataRayonShopModel _$DataRayonShopModelFromJson(Map<String, dynamic> json) =>
    DataRayonShopModel(
      id: json['id'] as int?,
      branchId: json['branch_id'] as int?,
      clusterId: json['cluster_id'] as int?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      status: json['status'] as String?,
      isCreate: json['is_create'] as int?,
      created: json['created'] as String?,
      isUpdate: json['is_update'] as int?,
      modified: json['modified'] as String?,
      isPrint: json['is_print'] as int?,
      printed: json['printed'] as String?,
      isActive: json['is_active'] as String?,
      isLog: json['is_log'] as String?,
    );

PaginatioModel _$PaginatioModelFromJson(Map<String, dynamic> json) =>
    PaginatioModel(
      count: json['count'] as int?,
      current: json['current'] as int?,
      perPage: json['perPage'] as int?,
      page: json['page'] as int?,
      requestedPage: json['requestedPage'] as int?,
      pageCount: json['pageCount'] as int?,
      start: json['start'] as int?,
      end: json['end'] as int?,
      prevPage: json['prevPage'] as bool?,
      nextPage: json['nextPage'] as bool?,
      sort: json['sort'] as String?,
      direction: json['direction'] as String?,
      sortDefault: json['sortDefault'] as bool?,
      directionDefault: json['directionDefault'] as bool?,
      completeSort: (json['completeSort'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      limit: json['limit'] as String?,
      scope: json['scope'] as String?,
      finder: json['finder'] as String?,
    );
