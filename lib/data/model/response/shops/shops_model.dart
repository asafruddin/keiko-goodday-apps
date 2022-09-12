// ignore_for_file: annotate_overrides, overridden_fields

import 'package:json_annotation/json_annotation.dart';
import 'package:keiko_good_day/domain/entity/shops_entity.dart';

part 'shops_model.g.dart';

@JsonSerializable(createToJson: false, explicitToJson: false)
class ShopsModel extends ShopEntity {
  const ShopsModel({List<DataShopModel>? shops, PaginatioModel? pagination})
      : super(shops, pagination);
  factory ShopsModel.fromJson(Map<String, dynamic> json) =>
      _$ShopsModelFromJson(json);
}

@JsonSerializable(createToJson: false, explicitToJson: false)
class DataShopModel extends DataShopsEntity {
  const DataShopModel(
      {int? id,
      int? branchId,
      int? motorisId,
      int? rayonId,
      String? code,
      String? name,
      String? address,
      String? telp,
      String? dateReg,
      String? img,
      String? lat,
      String? lang,
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
      DataRayonShopModel? rayon})
      : super(
            id,
            branchId,
            motorisId,
            rayonId,
            code,
            name,
            address,
            telp,
            dateReg,
            img,
            lat,
            lang,
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
            rayon);

  factory DataShopModel.fromJson(Map<String, dynamic> json) =>
      _$DataShopModelFromJson(json);
}

@JsonSerializable(createToJson: false, explicitToJson: false)
class DataRayonShopModel extends DataRayonShopEntity {
  const DataRayonShopModel(
      {int? id,
      int? branchId,
      int? clusterId,
      String? code,
      String? name,
      String? status,
      int? isCreate,
      String? created,
      int? isUpdate,
      String? modified,
      int? isPrint,
      String? printed,
      String? isActive,
      String? isLog})
      : super(id, branchId, clusterId, code, name, status, isCreate, created,
            isUpdate, modified, isPrint, printed, isActive, isLog);

  factory DataRayonShopModel.fromJson(Map<String, dynamic> json) =>
      _$DataRayonShopModelFromJson(json);
}

@JsonSerializable(
    createToJson: false, explicitToJson: false, fieldRename: FieldRename.none)
class PaginatioModel extends PaginationEntity {
  const PaginatioModel(
      {this.count,
      this.current,
      this.perPage,
      this.page,
      this.requestedPage,
      this.pageCount,
      this.start,
      this.end,
      this.prevPage,
      this.nextPage,
      this.sort,
      this.direction,
      this.sortDefault,
      this.directionDefault,
      this.completeSort,
      this.limit,
      this.scope,
      this.finder})
      : super(
            count,
            current,
            perPage,
            page,
            requestedPage,
            pageCount,
            start,
            end,
            prevPage,
            nextPage,
            sort,
            direction,
            sortDefault,
            directionDefault,
            completeSort,
            limit,
            scope,
            finder);

  factory PaginatioModel.fromJson(Map<String, dynamic> json) =>
      _$PaginatioModelFromJson(json);
  final int? count;
  final int? current;
  final int? perPage;
  final int? page;
  final int? requestedPage;
  final int? pageCount;
  final int? start;
  final int? end;
  final bool? prevPage;
  final bool? nextPage;
  final String? sort;
  final String? direction;
  final bool? sortDefault;
  final bool? directionDefault;
  final List<String>? completeSort;
  final String? limit;
  final String? scope;
  final String? finder;
}
