import 'package:dartz/dartz.dart';
import 'package:keiko_good_day/core/exceptions/failure.dart';
import 'package:keiko_good_day/core/use_case/use_case.dart';
import 'package:keiko_good_day/domain/entity/gift_entity.dart';
import 'package:keiko_good_day/domain/repository/master_repository.dart';

class GetGiftUseCase extends UseCase<GiftEntity, NoParams> {
  GetGiftUseCase(this.repository);

  final MasterRepository repository;

  @override
  Future<Either<Failure, GiftEntity>> build(NoParams params) {
    return repository.getGiftList();
  }
}
