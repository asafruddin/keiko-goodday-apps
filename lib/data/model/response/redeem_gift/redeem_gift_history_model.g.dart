// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'redeem_gift_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RedeemGiftHistoryModel _$RedeemGiftHistoryModelFromJson(
        Map<String, dynamic> json) =>
    RedeemGiftHistoryModel(
      redeemPoints: (json['redeemPoints'] as List<dynamic>?)
          ?.map((e) => RedeemPointsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : PaginatioModel.fromJson(json['pagination'] as Map<String, dynamic>),
    );

RedeemPointsModel _$RedeemPointsModelFromJson(Map<String, dynamic> json) =>
    RedeemPointsModel(
      id: json['id'] as int?,
      shopId: json['shop_id'] as int?,
      itemId: json['item_id'] as int?,
      motorisId: json['motoris_id'] as int?,
      date: json['date'] as String?,
      img: json['img'] as String?,
      code: json['code'] as String?,
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
      item: json['item'] == null
          ? null
          : GiftItemModel.fromJson(json['item'] as Map<String, dynamic>),
      shop: json['shop'] == null
          ? null
          : DataShopModel.fromJson(json['shop'] as Map<String, dynamic>),
    );

GiftItemModel _$GiftItemModelFromJson(Map<String, dynamic> json) =>
    GiftItemModel(
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
      printed: json['printed'] as String?,
      isActive: json['is_active'] as String?,
      isLog: json['is_log'] as String?,
    );
