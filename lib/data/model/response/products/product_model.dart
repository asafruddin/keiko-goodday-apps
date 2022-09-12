import 'package:json_annotation/json_annotation.dart';
import 'package:keiko_good_day/data/model/response/shops/shops_model.dart';
import 'package:keiko_good_day/domain/entity/product_entity.dart';

part 'product_model.g.dart';

@JsonSerializable(explicitToJson: false, createToJson: false)
class ProductModel extends ProductEntity {
  const ProductModel(
      {List<DataProductModel>? products, PaginatioModel? pagination})
      : super(products, pagination);

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

@JsonSerializable(explicitToJson: false, createToJson: false)
class DataProductModel extends DataProductsEntity {
  const DataProductModel(
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
      bool? printed,
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
  factory DataProductModel.fromJson(Map<String, dynamic> json) =>
      _$DataProductModelFromJson(json);
}
