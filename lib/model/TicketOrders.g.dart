// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TicketOrders.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketOrders _$TicketOrdersFromJson(Map<String, dynamic> json) {
  return TicketOrders((json['ticketOrder'] as List)
      ?.map((e) =>
          e == null ? null : TicketOrder.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$TicketOrdersToJson(TicketOrders instance) =>
    <String, dynamic>{'ticketOrder': instance.ticketOrder};
