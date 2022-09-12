import 'package:json_annotation/json_annotation.dart';
import 'package:keiko_good_day/domain/entity/login_entity.dart';

part 'login_model.g.dart';

@JsonSerializable(createToJson: false, explicitToJson: false)
class LoginModel extends LoginEntity {
  const LoginModel(
      {required int? status,
      required String? token,
      required LoginDataModel? data})
      : super(status: status, token: token, data: data);

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
}

@JsonSerializable(createToJson: false, explicitToJson: false)
class LoginDataModel extends LoginDataEntity {
  const LoginDataModel({int? id, String? type, String? name})
      : super(id: id, name: name, type: type);

  factory LoginDataModel.fromJson(Map<String, dynamic> json) =>
      _$LoginDataModelFromJson(json);
}
