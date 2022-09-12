import 'package:equatable/equatable.dart';
import 'package:keiko_good_day/domain/entity/shops_entity.dart';

class ConfirmationEntity extends Equatable {
  const ConfirmationEntity(this.confirm, this.pagination);
  final List<DataConfirmationEntity>? confirm;
  final PaginationEntity? pagination;

  @override
  List<Object?> get props => [confirm, pagination];
}

class DataConfirmationEntity extends Equatable {
  const DataConfirmationEntity(
      this.id,
      this.shopId,
      this.motorisId,
      this.code,
      this.date,
      this.img1,
      this.img2,
      this.img3,
      this.point1,
      this.point2,
      this.point3,
      this.description,
      this.latitude,
      this.longitude,
      this.status,
      this.isCreate,
      this.created,
      this.isUpdate,
      this.modified,
      this.isPrint,
      this.printed,
      this.isActive,
      this.isLog,
      this.shop);

  final int? id;
  final int? shopId;
  final int? motorisId;
  final String? code;
  final String? date;
  final String? img1;
  final String? img2;
  final String? img3;
  final String? point1;
  final String? point2;
  final String? point3;
  final String? description;
  final String? latitude;
  final String? longitude;
  final String? status;
  final int? isCreate;
  final String? created;
  final int? isUpdate;
  final String? modified;
  final int? isPrint;
  final String? printed;
  final String? isActive;
  final String? isLog;
  final DataShopsEntity? shop;
  @override
  List<Object?> get props => [
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
        shop
      ];
}
