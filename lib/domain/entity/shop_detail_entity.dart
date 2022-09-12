import 'package:keiko_good_day/domain/entity/shops_entity.dart';

class ShopDetailEntity {
  ShopDetailEntity(this.shop);
  DataShopDetailEntity? shop;
}

class DataShopDetailEntity {
  DataShopDetailEntity(
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
}
