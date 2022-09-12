import 'package:keiko_good_day/core/exceptions/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:keiko_good_day/core/use_case/use_case.dart';
import 'package:keiko_good_day/domain/entity/shop_detail_entity.dart';
import 'package:keiko_good_day/domain/repository/master_repository.dart';

class GetShopDetailUseCase extends UseCase<ShopDetailEntity, int> {
  GetShopDetailUseCase(this.repository);

  final MasterRepository repository;

  @override
  Future<Either<Failure, ShopDetailEntity>> build(int params) {
    return repository.getShopDetail(params);
  }
}
