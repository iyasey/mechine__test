// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DetailModelImpl _$$DetailModelImplFromJson(Map<String, dynamic> json) =>
    _$DetailModelImpl(
      id: json['id'] as String,
      task: json['task'] as String,
      isClicked: json['isClicked'] as bool?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$DetailModelImplToJson(_$DetailModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'task': instance.task,
      'isClicked': instance.isClicked,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
