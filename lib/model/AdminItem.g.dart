// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AdminItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminItem _$AdminItemFromJson(Map<String, dynamic> json) {
  return AdminItem(json['inPrice'] as String, json['itemId'] as String,
      json['itemName'] as String);
}

Map<String, dynamic> _$AdminItemToJson(AdminItem instance) => <String, dynamic>{
      'inPrice': instance.inPrice,
      'itemId': instance.itemId,
      'itemName': instance.itemName
    };
