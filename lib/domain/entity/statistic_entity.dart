import 'package:equatable/equatable.dart';

class StatisticEntity extends Equatable {
  const StatisticEntity(this.rayons, this.clusters, this.shops);

  final int? rayons;
  final int? clusters;
  final int? shops;

  @override
  List<Object?> get props => [rayons, clusters, shops];
}
