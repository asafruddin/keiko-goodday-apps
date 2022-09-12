// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchasing_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$PurchasingBodyToJson(PurchasingBody instance) =>
    <String, dynamic>{
      'shop_id': instance.shopId,
      'wholesale_deal_lines':
          instance.wholesaleDealLines?.map((e) => e.toJson()).toList(),
      'is_create': instance.isCreate,
      'point_total': instance.pointTotal,
    };

Map<String, dynamic> _$WholesaleDealLinesToJson(WholesaleDealLines instance) =>
    <String, dynamic>{
      'item_id': instance.itemId,
      'qty': instance.qty,
    };
