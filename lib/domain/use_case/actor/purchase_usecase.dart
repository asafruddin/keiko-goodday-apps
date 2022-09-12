import 'package:keiko_good_day/core/exceptions/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:keiko_good_day/core/use_case/use_case.dart';
import 'package:keiko_good_day/data/model/request/purchasing/purchasing_body.dart';
import 'package:keiko_good_day/domain/repository/actor_repository.dart';

class PurchaseUseCase extends UseCase<void, PurchasingBody> {
  PurchaseUseCase(this.repository);

  final ActorRepository repository;

  @override
  Future<Either<Failure, void>> build(PurchasingBody params) {
    return repository.purchaseProduct(params);
  }
}
