// ignore_for_file: avoid_positional_boolean_parameters

import 'package:equatable/equatable.dart';

class ShopEntity extends Equatable {
  const ShopEntity(this.shops, this.pagination);
  final List<DataShopsEntity>? shops;
  final PaginationEntity? pagination;

  @override
  List<Object?> get props => [shops, pagination];
}

class DataShopsEntity extends Equatable {
  const DataShopsEntity(
      this.id,
      this.branchId,
      this.motorisId,
      this.rayonId,
      this.code,
      this.name,
      this.address,
      this.telp,
      this.dateReg,
      this.img,
      this.lat,
      this.lang,
      this.point,
      this.description,
      this.status,
      this.isCreate,
      this.created,
      this.isUpdate,
      this.modified,
      this.isPrint,
      this.printed,
      this.isActive,
      this.isLog,
      this.rayon);

  final int? id;
  final int? branchId;
  final int? motorisId;
  final int? rayonId;
  final String? code;
  final String? name;
  final String? address;
  final String? telp;
  final String? dateReg;
  final String? img;
  final String? lat;
  final String? lang;
  final String? point;
  final String? description;
  final String? status;
  final int? isCreate;
  final String? created;
  final int? isUpdate;
  final String? modified;
  final int? isPrint;
  final String? printed;
  final String? isActive;
  final String? isLog;
  final DataRayonShopEntity? rayon;

  @override
  List<Object?> get props => [
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
        rayon
      ];
}

class DataRayonShopEntity extends Equatable {
  const DataRayonShopEntity(
      this.id,
      this.branchId,
      this.clusterId,
      this.code,
      this.name,
      this.status,
      this.isCreate,
      this.created,
      this.isUpdate,
      this.modified,
      this.isPrint,
      this.printed,
      this.isActive,
      this.isLog);

  final int? id;
  final int? branchId;
  final int? clusterId;
  final String? code;
  final String? name;
  final String? status;
  final int? isCreate;
  final String? created;
  final int? isUpdate;
  final String? modified;
  final int? isPrint;
  final String? printed;
  final String? isActive;
  final String? isLog;

  @override
  List<Object?> get props => [
        id,
        branchId,
        clusterId,
        code,
        name,
        status,
        isCreate,
        created,
        isUpdate,
        modified,
        isPrint,
        printed,
        isActive,
        isLog
      ];
}

class PaginationEntity extends Equatable {
  const PaginationEntity(
      this.count,
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
      this.finder);
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

  @override
  List<Object?> get props => [
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
        finder
      ];
}
