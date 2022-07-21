import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  const LoginEntity(
      {required this.status,
      required this.token,
      required this.data,
      required this.message});
  final int? status;
  final String? token;
  final String? message;
  final LoginDataEntity? data;

  @override
  List<Object?> get props => [status, token, data, message];
}

class LoginDataEntity extends Equatable {
  const LoginDataEntity(
      {required this.id,
      required this.partnerId,
      required this.name,
      required this.email,
      required this.address,
      required this.telp,
      required this.rule,
      required this.division,
      required this.username,
      required this.dateIn,
      required this.userId,
      required this.isCreate,
      required this.created,
      required this.isUpdate,
      required this.modified,
      required this.isPrint,
      required this.printed,
      required this.isActive,
      required this.isLog});
  final int? id;
  final int? partnerId;
  final String? name;
  final String? email;
  final String? address;
  final String? telp;
  final String? rule;
  final String? division;
  final String? username;
  final String? dateIn;
  final int? userId;
  final int? isCreate;
  final String? created;
  final int? isUpdate;
  final String? modified;
  final int? isPrint;
  final dynamic printed;
  final String? isActive;
  final String? isLog;

  @override
  List<Object?> get props => [
        id,
        partnerId,
        name,
        email,
        address,
        telp,
        rule,
        division,
        username,
        dateIn,
        userId,
        isCreate,
        created,
        isUpdate,
        modified,
        isPrint,
        printed,
        isActive,
        isLog
      ];
}
