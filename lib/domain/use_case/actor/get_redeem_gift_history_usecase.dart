import 'package:keiko_good_day/core/exceptions/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:keiko_good_day/core/use_case/use_case.dart';
import 'package:keiko_good_day/domain/entity/redeem_gift_history.dart';
import 'package:keiko_good_day/domain/repository/actor_repository.dart';

class GetRedeemGiftHistoryUseCase
    extends UseCase<RedeemGiftHistoryEntity, int> {
  GetRedeemGiftHistoryUseCase(this.repository);

  final ActorRepository repository;

  @override
  Future<Either<Failure, RedeemGiftHistoryEntity>> build(int params) {
    return repository.getRedeemGiftHistory(params);
  }
}
