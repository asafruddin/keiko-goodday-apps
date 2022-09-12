import 'package:json_annotation/json_annotation.dart';
import 'package:keiko_good_day/data/model/response/shops/shops_model.dart';
import 'package:keiko_good_day/domain/entity/gift_entity.dart';

part 'gift_model.g.dart';

@JsonSerializable(createToJson: false, explicitToJson: false)
class GiftModel extends GiftEntity {
  const GiftModel(List<DataGiftModel>? gift, PaginatioModel? pagination)
      : super(gift, pagination);
  factory GiftModel.fromJson(Map<String, dynamic> json) =>
      _$GiftModelFromJson(json);
}

@JsonSerializable(createToJson: false, explicitToJson: false)
class DataGiftModel extends DataGiftEntity {
  const DataGiftModel(
      int? id,
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
      String? isLog)
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
  factory DataGiftModel.fromJson(Map<String, dynamic> json) =>
      _$DataGiftModelFromJson(json);
}
