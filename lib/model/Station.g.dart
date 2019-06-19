// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Station.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Station _$StationFromJson(Map<String, dynamic> json) {
  return Station(json['code'] as String, json['duanpin'] as String,
      json['name'] as String, json['quanpin'] as String);
}

Map<String, dynamic> _$StationToJson(Station instance) => <String, dynamic>{
      'code': instance.code,
      'duanpin': instance.duanpin,
      'name': instance.name,
      'quanpin': instance.quanpin
    };
