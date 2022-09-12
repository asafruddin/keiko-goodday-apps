import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  const LoginEntity(
      {required this.status, required this.token, required this.data});
  final int? status;
  final String? token;
  final LoginDataEntity? data;

  @override
  List<Object?> get props => [status, token, data];
}

class LoginDataEntity extends Equatable {
  const LoginDataEntity({
    required this.id,
    required this.type,
    required this.name,
  });
  final int? id;
  final String? type;
  final String? name;

  @override
  List<Object?> get props => [id, type, name];
}
