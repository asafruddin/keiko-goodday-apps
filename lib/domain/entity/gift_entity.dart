import 'package:equatable/equatable.dart';
import 'package:keiko_good_day/domain/entity/shops_entity.dart';

class GiftEntity extends Equatable {
  const GiftEntity(this.gift, this.pagination);
  final List<DataGiftEntity>? gift;
  final PaginationEntity? pagination;

  @override
  List<Object?> get props => [gift, pagination];
}

class DataGiftEntity extends Equatable {
  const DataGiftEntity(
      this.id,
      this.branchId,
      this.code,
      this.name,
      this.point,
      this.description,
      this.img,
      this.unit,
      this.type,
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
  final String? code;
  final String? name;
  final String? point;
  final String? description;
  final String? img;
  final String? unit;
  final String? type;
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
        isLog
      ];
}
