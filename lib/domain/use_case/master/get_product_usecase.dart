import 'package:keiko_good_day/core/exceptions/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:keiko_good_day/core/use_case/use_case.dart';
import 'package:keiko_good_day/domain/entity/product_entity.dart';
import 'package:keiko_good_day/domain/repository/master_repository.dart';

class GetProducUseCase extends UseCase<ProductEntity, NoParams> {
  GetProducUseCase(this.repository);

  final MasterRepository repository;

  @override
  Future<Either<Failure, ProductEntity>> build(NoParams params) {
    return repository.getProductList();
  }
}
