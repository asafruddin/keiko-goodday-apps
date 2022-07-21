import 'package:keiko_good_day/core/exceptions/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:keiko_good_day/core/use_case/use_case.dart';
import 'package:keiko_good_day/data/model/request/auth/login_body.dart';
import 'package:keiko_good_day/domain/entity/login_entity.dart';
import 'package:keiko_good_day/domain/repository/auth_repository.dart';

class LoginUseCase extends UseCase<LoginEntity, LoginBody> {
  LoginUseCase(this.repository);

  final AuthRepository repository;

  @override
  Future<Either<Failure, LoginEntity>> build(LoginBody params) {
    return repository.login(params);
  }
}
