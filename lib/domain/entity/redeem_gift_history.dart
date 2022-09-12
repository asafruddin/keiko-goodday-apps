import 'package:equatable/equatable.dart';
import 'package:keiko_good_day/domain/entity/shops_entity.dart';

class RedeemGiftHistoryEntity extends Equatable {
  const RedeemGiftHistoryEntity(this.redeemPoints, this.pagination);
  final List<RedeemPointsEntity>? redeemPoints;
  final PaginationEntity? pagination;

  @override
  List<Object?> get props => [redeemPoints, pagination];
}

class RedeemPointsEntity extends Equatable {
  const RedeemPointsEntity(
      this.id,
      this.shopId,
      this.itemId,
      this.motorisId,
      this.date,
      this.img,
      this.code,
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
      this.item,
      this.shop);
  final int? id;
  final int? shopId;
  final int? itemId;
  final int? motorisId;
  final String? date;
  final String? img;
  final String? code;
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
  final GiftItemEntity? item;
  final DataShopsEntity? shop;

  @override
  List<Object?> get props => [
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
        shop
      ];
}

class GiftItemEntity extends Equatable {
  GiftItemEntity(
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
