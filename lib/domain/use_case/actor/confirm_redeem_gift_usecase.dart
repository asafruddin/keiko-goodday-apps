import 'package:keiko_good_day/core/exceptions/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:keiko_good_day/core/use_case/use_case.dart';
import 'package:keiko_good_day/data/model/request/redeem_gift/confirm_redeem_gift_body.dart';
import 'package:keiko_good_day/domain/repository/actor_repository.dart';

class ConfirmRedeemGiftUseCase extends UseCase<void, ConfirmRedeemGiftBody> {
  ConfirmRedeemGiftUseCase(this.repository);

  final ActorRepository repository;
  @override
  Future<Either<Failure, void>> build(ConfirmRedeemGiftBody params) {
    return repository.confirmRedeemGift(params);
  }
}
