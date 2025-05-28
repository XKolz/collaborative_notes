// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DocumentImpl _$$DocumentImplFromJson(Map<String, dynamic> json) =>
    _$DocumentImpl(
      id: json['id'] as String,
      content: json['content'] as String,
      lastModified: DateTime.parse(json['lastModified'] as String),
      lastModifiedBy: json['lastModifiedBy'] as String? ?? '',
      version: (json['version'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$DocumentImplToJson(_$DocumentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'lastModified': instance.lastModified.toIso8601String(),
      'lastModifiedBy': instance.lastModifiedBy,
      'version': instance.version,
    };

_$DocumentChangeImpl _$$DocumentChangeImplFromJson(Map<String, dynamic> json) =>
    _$DocumentChangeImpl(
      documentId: json['documentId'] as String,
      content: json['content'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      userId: json['userId'] as String,
      version: (json['version'] as num).toInt(),
    );

Map<String, dynamic> _$$DocumentChangeImplToJson(
        _$DocumentChangeImpl instance) =>
    <String, dynamic>{
      'documentId': instance.documentId,
      'content': instance.content,
      'timestamp': instance.timestamp.toIso8601String(),
      'userId': instance.userId,
      'version': instance.version,
    };
