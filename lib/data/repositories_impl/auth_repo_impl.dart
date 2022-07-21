import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:keiko_good_day/core/exceptions/failure.dart';
import 'package:keiko_good_day/data/datasource/auth_source.dart';
import 'package:keiko_good_day/data/model/request/auth/login_body.dart';
import 'package:keiko_good_day/domain/entity/login_entity.dart';
import 'package:keiko_good_day/domain/repository/auth_repository.dart';

class AuthRepoImpl implements AuthRepository {
  AuthRepoImpl(this.authSource);

  final AuthSource? authSource;

  @override
  Future<Either<Failure, LoginEntity>> login(LoginBody body) async {
    try {
      print('SOMETHING --> ${authSource!.login(body)}');
      return authSource!.login(body).then(right);
    } on DioError catch (e) {
      final failure = ServerFailure(message: e.message);
      return left(failure);
    } catch (e) {
      return left(AnotherFailure(e.toString()));
    }
  }
}
