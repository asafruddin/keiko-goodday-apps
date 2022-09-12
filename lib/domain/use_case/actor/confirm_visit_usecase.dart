import 'package:keiko_good_day/core/exceptions/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:keiko_good_day/core/use_case/use_case.dart';
import 'package:keiko_good_day/data/model/request/confirmation/picture_confirmation_body.dart';
import 'package:keiko_good_day/domain/repository/actor_repository.dart';

class ConfirmVisitUseCase extends UseCase<void, PictureConfirmationBody> {
  ConfirmVisitUseCase(this.repository);

  final ActorRepository repository;

  @override
  Future<Either<Failure, void>> build(PictureConfirmationBody params) {
    return repository.confirmVisitShop(params);
  }
}
