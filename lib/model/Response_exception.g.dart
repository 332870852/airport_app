// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Response_exception.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseException _$ResponseExceptionFromJson(Map<String, dynamic> json) {
  return ResponseException(
      json['errorToken'] as String,
      json['code'] as String,
      json['message'] as String,
      json['solution'] as String,
      (json['subErrors'] as List)
          ?.map((e) =>
              e == null ? null : SubError.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ResponseExceptionToJson(ResponseException instance) =>
    <String, dynamic>{
      'errorToken': instance.errorToken,
      'code': instance.code,
      'message': instance.message,
      'solution': instance.solution,
      'subErrors': instance.subErrors
    };
