// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SubError.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubError _$SubErrorFromJson(Map<String, dynamic> json) {
  return SubError(json['code'] as String, json['message'] as String);
}

Map<String, dynamic> _$SubErrorToJson(SubError instance) =>
    <String, dynamic>{'code': instance.code, 'message': instance.message};
