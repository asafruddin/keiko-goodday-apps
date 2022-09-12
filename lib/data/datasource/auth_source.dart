// ignore_for_file: one_member_abstracts

import 'package:dio/dio.dart';
import 'package:keiko_good_day/data/model/request/auth/login_body.dart';
import 'package:keiko_good_day/data/model/response/auth/login_model.dart';
import 'package:keiko_good_day/domain/entity/login_entity.dart';

abstract class AuthSource {
  Future<LoginEntity> login(LoginBody body);
}

class AuthSourceImpl implements AuthSource {
  AuthSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<LoginEntity> login(LoginBody body) async {
    final response =
        await _dio.post<dynamic>('/api/auth/login.json', data: body.toJson());
    return LoginModel.fromJson(response.data as Map<String, dynamic>);
  }
}
