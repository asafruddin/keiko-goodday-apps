import 'package:keiko_good_day/core/exceptions/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:keiko_good_day/core/use_case/use_case.dart';
import 'package:keiko_good_day/domain/entity/cluster_entity.dart';
import 'package:keiko_good_day/domain/repository/master_repository.dart';

class GetClusterUseCase extends UseCase<ClusterEntity, NoParams> {
  GetClusterUseCase(this.repository);

  final MasterRepository repository;
  @override
  Future<Either<Failure, ClusterEntity>> build(NoParams params) {
    return repository.getClusterList();
  }
}
