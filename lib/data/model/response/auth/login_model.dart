import 'package:json_annotation/json_annotation.dart';
import 'package:keiko_good_day/domain/entity/login_entity.dart';

part 'login_model.g.dart';

@JsonSerializable(createToJson: false, explicitToJson: false)
class LoginModel extends LoginEntity {
  const LoginModel(
      {required int? status,
      required String? token,
      required String? message,
      required LoginDataModel? data})
      : super(status: status, token: token, data: data, message: message);

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
}

@JsonSerializable(createToJson: false, explicitToJson: false)
class LoginDataModel extends LoginDataEntity {
  const LoginDataModel(
      {required int? id,
      required int? partnerId,
      required String? name,
      required String? email,
      required String? address,
      required String? telp,
      required String? rule,
      required String? division,
      required String? username,
      required String? dateIn,
      required int? userId,
      required int? isCreate,
      required String? created,
      required int? isUpdate,
      required String? modified,
      required int? isPrint,
      required dynamic printed,
      required String? isActive,
      required String? isLog})
      : super(
            id: id,
            partnerId: partnerId,
            name: name,
            email: email,
            address: address,
            telp: telp,
            rule: rule,
            division: division,
            username: username,
            dateIn: dateIn,
            userId: userId,
            isCreate: isCreate,
            created: created,
            isUpdate: isUpdate,
            modified: modified,
            isPrint: isPrint,
            printed: printed,
            isActive: isActive,
            isLog: isLog);

  factory LoginDataModel.fromJson(Map<String, dynamic> json) =>
      _$LoginDataModelFromJson(json);
}
