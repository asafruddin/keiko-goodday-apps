import 'package:dartz/dartz.dart';
import 'package:keiko_good_day/core/exceptions/failure.dart';
import 'package:keiko_good_day/core/use_case/use_case.dart';
import 'package:keiko_good_day/domain/entity/rayons_entity.dart';
import 'package:keiko_good_day/domain/repository/master_repository.dart';

class GetRayonsUseCase extends UseCase<RayonsEntity, int> {
  GetRayonsUseCase(this.repository);

  final MasterRepository repository;

  @override
  Future<Either<Failure, RayonsEntity>> build(int params) {
    return repository.getRayonsList(params);
  }
}
