// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rayons_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RayonsModel _$RayonsModelFromJson(Map<String, dynamic> json) => RayonsModel(
      dataRayons: (json['dataRayons'] as List<dynamic>?)
          ?.map((e) => DataRayonModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

DataRayonModel _$DataRayonModelFromJson(Map<String, dynamic> json) =>
    DataRayonModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      totalKedai: json['total_kedai'] as int?,
    );
