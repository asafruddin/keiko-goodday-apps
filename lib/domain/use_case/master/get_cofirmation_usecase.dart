import 'package:dartz/dartz.dart';
import 'package:keiko_good_day/core/exceptions/failure.dart';
import 'package:keiko_good_day/core/use_case/use_case.dart';
import 'package:keiko_good_day/data/model/request/confirmation/confirmation_body.dart';
import 'package:keiko_good_day/domain/entity/confirmation_entity.dart';
import 'package:keiko_good_day/domain/repository/master_repository.dart';

class GetConfirmationUseCase
    extends UseCase<ConfirmationEntity, ConfirmationBody> {
  GetConfirmationUseCase(this.repository);

  final MasterRepository repository;

  @override
  Future<Either<Failure, ConfirmationEntity>> build(ConfirmationBody params) {
    return repository.getConfirmation(params);
  }
}
