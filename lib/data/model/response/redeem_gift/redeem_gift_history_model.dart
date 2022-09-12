import 'package:json_annotation/json_annotation.dart';
import 'package:keiko_good_day/data/model/response/shops/shop_detail_model.dart';
import 'package:keiko_good_day/data/model/response/shops/shops_model.dart';
import 'package:keiko_good_day/domain/entity/redeem_gift_history.dart';

part 'redeem_gift_history_model.g.dart';

@JsonSerializable(
    createToJson: false, explicitToJson: false, fieldRename: FieldRename.none)
class RedeemGiftHistoryModel extends RedeemGiftHistoryEntity {
  const RedeemGiftHistoryModel(
      {List<RedeemPointsModel>? redeemPoints, PaginatioModel? pagination})
      : super(redeemPoints, pagination);

  factory RedeemGiftHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$RedeemGiftHistoryModelFromJson(json);
}

@JsonSerializable(createToJson: false, explicitToJson: false)
class RedeemPointsModel extends RedeemPointsEntity {
  const RedeemPointsModel(
      {int? id,
      int? shopId,
      int? itemId,
      int? motorisId,
      String? date,
      String? img,
      String? code,
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
      GiftItemModel? item,
      DataShopModel? shop})
      : super(
            id,
            shopId,
            itemId,
            motorisId,
            date,
            img,
            code,
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
            item,
            shop);

  factory RedeemPointsModel.fromJson(Map<String, dynamic> json) =>
      _$RedeemPointsModelFromJson(json);
}

@JsonSerializable(createToJson: false, explicitToJson: false)
class GiftItemModel extends GiftItemEntity {
  GiftItemModel(
      {int? id,
      int? branchId,
      String? code,
      String? name,
      String? point,
      String? description,
      String? img,
      String? unit,
      String? type,
      String? status,
      int? isCreate,
      String? created,
      int? isUpdate,
      String? modified,
      int? isPrint,
      String? printed,
      String? isActive,
      String? isLog})
      : super(
            id,
            branchId,
            code,
            name,
            point,
            description,
            img,
            unit,
            type,
            status,
            isCreate,
            created,
            isUpdate,
            modified,
            isPrint,
            printed,
            isActive,
            isLog);

  factory GiftItemModel.fromJson(Map<String, dynamic> json) =>
      _$GiftItemModelFromJson(json);
}
