// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AirItem_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirItemsList _$AirItemsListFromJson(Map<String, dynamic> json) {
  return AirItemsList(
      json['items'] == null
          ? null
          : AdminItem.fromJson(json['items'] as Map<String, dynamic>),
      json['pageNo'] as int,
      json['pageSize'] as int,
      json['totalCount'] as int);
}

Map<String, dynamic> _$AirItemsListToJson(AirItemsList instance) =>
    <String, dynamic>{
      'items': instance.items,
      'pageNo': instance.pageNo,
      'pageSize': instance.pageSize,
      'totalCount': instance.totalCount
    };
