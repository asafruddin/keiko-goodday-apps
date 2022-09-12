import 'package:json_annotation/json_annotation.dart';
import 'package:keiko_good_day/domain/entity/statistic_entity.dart';

part 'statistic_model.g.dart';

@JsonSerializable(createToJson: false, explicitToJson: false)
class StatisticModel extends StatisticEntity {
  const StatisticModel({int? rayons, int? clusters, int? shops})
      : super(rayons, clusters, shops);

  factory StatisticModel.fromJson(Map<String, dynamic> json) =>
      _$StatisticModelFromJson(json);
}
