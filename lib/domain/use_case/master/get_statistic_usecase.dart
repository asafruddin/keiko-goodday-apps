import 'package:dartz/dartz.dart';
import 'package:keiko_good_day/core/exceptions/failure.dart';
import 'package:keiko_good_day/core/use_case/use_case.dart';
import 'package:keiko_good_day/domain/entity/statistic_entity.dart';
import 'package:keiko_good_day/domain/repository/master_repository.dart';

class GetStatisticUseCase extends UseCase<StatisticEntity, NoParams> {
  GetStatisticUseCase(this.repository);

  final MasterRepository repository;

  @override
  Future<Either<Failure, StatisticEntity>> build(NoParams params) {
    return repository.getStatistic();
  }
}
