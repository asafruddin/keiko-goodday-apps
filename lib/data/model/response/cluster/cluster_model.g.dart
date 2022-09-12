// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cluster_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClusterModel _$ClusterModelFromJson(Map<String, dynamic> json) => ClusterModel(
      dataClusters: (json['dataClusters'] as List<dynamic>?)
          ?.map((e) => DataClusterModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

DataClusterModel _$DataClusterModelFromJson(Map<String, dynamic> json) =>
    DataClusterModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      totalRayon: json['total_rayon'] as int?,
    );
