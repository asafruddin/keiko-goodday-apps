import 'package:dartz/dartz.dart';
import 'package:keiko_good_day/core/exceptions/failure.dart';
import 'package:keiko_good_day/core/use_case/use_case.dart';
import 'package:keiko_good_day/domain/entity/shops_entity.dart';
import 'package:keiko_good_day/domain/repository/master_repository.dart';

class GetShopsUseCase extends UseCase<ShopEntity, int> {
  GetShopsUseCase(this.repository);

  final MasterRepository repository;

  @override
  Future<Either<Failure, ShopEntity>> build(int params) {
    return repository.getShopsList(params);
  }
}
