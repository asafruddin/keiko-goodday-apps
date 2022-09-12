import 'package:json_annotation/json_annotation.dart';
import 'package:keiko_good_day/data/model/response/shops/shops_model.dart';
import 'package:keiko_good_day/domain/entity/confirmation_entity.dart';

part 'confirmation_model.g.dart';

@JsonSerializable(createToJson: false, explicitToJson: false)
class ConfirmationModel extends ConfirmationEntity {
  const ConfirmationModel(
      {List<DataConfirmationModel>? confirm, PaginatioModel? pagination})
      : super(confirm, pagination);

  factory ConfirmationModel.fromJson(Map<String, dynamic> json) =>
      _$ConfirmationModelFromJson(json);
}

@JsonSerializable(createToJson: false, explicitToJson: false)
class DataConfirmationModel extends DataConfirmationEntity {
  const DataConfirmationModel(
      {int? id,
      int? shopId,
      int? motorisId,
      String? code,
      String? date,
      String? img1,
      String? img2,
      String? img3,
      String? point1,
      String? point2,
      String? point3,
      String? description,
      String? latitude,
      String? longitude,
      String? status,
      int? isCreate,
      String? created,
      int? isUpdate,
      String? modified,
      int? isPrint,
      String? printed,
      String? isActive,
      String? isLog,
      DataShopModel? shop})
      : super(
            id,
            shopId,
            motorisId,
            code,
            date,
            img1,
            img2,
            img3,
            point1,
            point2,
            point3,
            description,
            latitude,
            longitude,
            status,
            isCreate,
            created,
            isUpdate,
            modified,
            isPrint,
            printed,
            isActive,
            isLog,
            shop);

  factory DataConfirmationModel.fromJson(Map<String, dynamic> json) =>
      _$DataConfirmationModelFromJson(json);
}
