import 'package:equatable/equatable.dart';

class ClusterEntity extends Equatable {
  const ClusterEntity(this.dataClusters);

  final List<DataClusterEntity>? dataClusters;

  @override
  List<Object?> get props => [dataClusters];
}

class DataClusterEntity extends Equatable {
  const DataClusterEntity(this.id, this.name, this.totalRayon);

  final int? id;
  final String? name;
  final int? totalRayon;

  @override
  List<Object?> get props => [id, name, totalRayon];
}
