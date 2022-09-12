import 'package:equatable/equatable.dart';

class RayonsEntity extends Equatable {
  const RayonsEntity(this.dataRayons);

  final List<DataRayonEntity>? dataRayons;

  @override
  List<Object?> get props => [dataRayons];
}

class DataRayonEntity extends Equatable {
  const DataRayonEntity(this.id, this.name, this.totalKedai);

  final int? id;
  final String? name;
  final int? totalKedai;

  @override
  List<Object?> get props => [id, name, totalKedai];
}
