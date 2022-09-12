import 'package:json_annotation/json_annotation.dart';
import 'package:keiko_good_day/domain/entity/rayons_entity.dart';

part 'rayons_model.g.dart';

@JsonSerializable(createToJson: false, explicitToJson: false)
class RayonsModel extends RayonsEntity {
  const RayonsModel({this.dataRayons}) : super(dataRayons);

  factory RayonsModel.fromJson(Map<String, dynamic> json) =>
      _$RayonsModelFromJson(json);
  @JsonKey(name: 'dataRayons')
  final List<DataRayonModel>? dataRayons;
}

@JsonSerializable(createToJson: false, explicitToJson: false)
class DataRayonModel extends DataRayonEntity {
  const DataRayonModel({int? id, String? name, int? totalKedai})
      : super(id, name, totalKedai);

  factory DataRayonModel.fromJson(Map<String, dynamic> json) =>
      _$DataRayonModelFromJson(json);
}
