// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PayResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayResult _$PayResultFromJson(Map<String, dynamic> json) {
  return PayResult(
      json['package'] as String,
      json['appid'] as String,
      json['sign'] as String,
      json['partnerid'] as String,
      json['prepayid'] as String,
      json['noncestr'] as String,
      json['timestamp'] as String);
}

Map<String, dynamic> _$PayResultToJson(PayResult instance) => <String, dynamic>{
      'package': instance.packageValue,
      'appid': instance.appid,
      'sign': instance.sign,
      'partnerid': instance.partnerid,
      'prepayid': instance.prepayid,
      'noncestr': instance.noncestr,
      'timestamp': instance.timestamp
    };
