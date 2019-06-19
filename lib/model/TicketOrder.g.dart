// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TicketOrder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketOrder _$TicketOrderFromJson(Map<String, dynamic> json) {
  return TicketOrder(
      json['facePrice'] as num,
      json['feeDetail'] as String,
      json['idcardNo'] as String,
      json['idcardType'] as int,
      json['insurance'] == null
          ? null
          : OInsurance.fromJson(json['insurance'] as Map<String, dynamic>),
      json['itemId'] as String,
      json['orderNo'] as String,
      json['otherFee'] as num,
      json['passengerName'] as String,
      json['passengerTel'] as String,
      json['payCash'] as num,
      json['purPrice'] as num,
      json['refundFee'] as num,
      json['saleOrderNo'] as String,
      json['salePrice'] as num,
      json['seatInfo'] as String,
      json['seatName'] as String,
      json['seatType'] as int,
      json['state'] as int,
      json['stateName'] as String,
      json['ticketNo'] as String,
      json['ticketType'] as int,
      json['title'] as String,
      json['totalRefundAmount'] as num);
}

Map<String, dynamic> _$TicketOrderToJson(TicketOrder instance) =>
    <String, dynamic>{
      'facePrice': instance.facePrice,
      'feeDetail': instance.feeDetail,
      'idcardNo': instance.idcardNo,
      'idcardType': instance.idcardType,
      'insurance': instance.insurance,
      'itemId': instance.itemId,
      'orderNo': instance.orderNo,
      'otherFee': instance.otherFee,
      'passengerName': instance.passengerName,
      'passengerTel': instance.passengerTel,
      'payCash': instance.payCash,
      'purPrice': instance.purPrice,
      'refundFee': instance.refundFee,
      'saleOrderNo': instance.saleOrderNo,
      'salePrice': instance.salePrice,
      'seatInfo': instance.seatInfo,
      'seatName': instance.seatName,
      'seatType': instance.seatType,
      'state': instance.state,
      'stateName': instance.stateName,
      'ticketNo': instance.ticketNo,
      'ticketType': instance.ticketType,
      'title': instance.title,
      'totalRefundAmount': instance.totalRefundAmount
    };
