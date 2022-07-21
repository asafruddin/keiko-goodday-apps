import 'package:dartz/dartz.dart';
import 'package:keiko_good_day/core/exceptions/failure.dart';
import 'package:keiko_good_day/data/model/request/auth/login_body.dart';
import 'package:keiko_good_day/domain/entity/login_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginEntity>> login(LoginBody body);
}
