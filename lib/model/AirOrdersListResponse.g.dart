// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AirOrdersListResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirOrdersListResponse _$AirOrdersListResponseFromJson(
    Map<String, dynamic> json) {
  return AirOrdersListResponse(
      json['pageNo'] as int,
      json['pageSize'] as int,
      (json['ticketTrades'] as List)
          ?.map((e) => e == null
              ? null
              : TicketTrade.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['totolCount'] as int);
}

Map<String, dynamic> _$AirOrdersListResponseToJson(
        AirOrdersListResponse instance) =>
    <String, dynamic>{
      'pageNo': instance.pageNo,
      'pageSize': instance.pageSize,
      'ticketTrades': instance.ticketTrades,
      'totolCount': instance.totolCount
    };
