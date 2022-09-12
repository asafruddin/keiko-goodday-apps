// ignore_for_file: avoid_positional_boolean_parameters

import 'package:equatable/equatable.dart';
import 'package:keiko_good_day/domain/entity/shops_entity.dart';

class ProductEntity extends Equatable {
  const ProductEntity(this.products, this.pagination);

  final List<DataProductsEntity>? products;
  final PaginationEntity? pagination;

  @override
  List<Object?> get props => [products, pagination];
}

class DataProductsEntity extends Equatable {
  const DataProductsEntity(
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
      this.isLog,
      {this.quantity});
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
  final bool? printed;
  final String? isActive;
  final String? isLog;
  final int? quantity;

  DataProductsEntity copyWith({int? quantity}) {
    return DataProductsEntity(
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
        isLog,
        quantity: quantity ?? this.quantity);
  }

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
        isLog,
        quantity
      ];
}
