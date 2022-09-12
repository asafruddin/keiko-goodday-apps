// ignore_for_file: annotate_overrides, overridden_fields

import 'package:json_annotation/json_annotation.dart';
import 'package:keiko_good_day/domain/entity/cluster_entity.dart';

part 'cluster_model.g.dart';

@JsonSerializable(createToJson: false, explicitToJson: false)
class ClusterModel extends ClusterEntity {
  const ClusterModel({this.dataClusters}) : super(dataClusters);

  factory ClusterModel.fromJson(Map<String, dynamic> json) =>
      _$ClusterModelFromJson(json);

  @JsonKey(name: 'dataClusters')
  final List<DataClusterModel>? dataClusters;
}

@JsonSerializable(createToJson: false, explicitToJson: false)
class DataClusterModel extends DataClusterEntity {
  const DataClusterModel({int? id, String? name, int? totalRayon})
      : super(id, name, totalRayon);

  factory DataClusterModel.fromJson(Map<String, dynamic> json) =>
      _$DataClusterModelFromJson(json);
}
