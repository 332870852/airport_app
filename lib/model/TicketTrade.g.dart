// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TicketTrade.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketTrade _$TicketTradeFromJson(Map<String, dynamic> json) {
  return TicketTrade(
      json['billState'] as int,
      json['billTime'] as String,
      json['contactName'] as String,
      json['contactTel'] as String,
      json['ctime'] as String,
      json['etime'] as String,
      json['legs'] as String,
      json['orderType'] as int,
      json['recevieStation'] as String,
      json['recevieTime'] as String,
      json['remark'] as String,
      json['startStation'] as String,
      json['startTime'] as String,
      json['state'] as int,
      json['stateName'] as String,
      json['ticketOrders'] == null
          ? null
          : TicketOrders.fromJson(json['ticketOrders'] as Map<String, dynamic>),
      json['title'] as String,
      json['totalFacePrice'] as num,
      json['totalOtherFee'] as num,
      json['totalPayCash'] as num,
      json['totalPurPrice'] as num,
      json['totalRefundAmount'] as num,
      json['totalRefundFee'] as num,
      json['totalSalePrice'] as num,
      json['tplId'] as String,
      json['tradeNo'] as String,
      json['trainNo'] as String);
}

Map<String, dynamic> _$TicketTradeToJson(TicketTrade instance) =>
    <String, dynamic>{
      'billState': instance.billState,
      'billTime': instance.billTime,
      'contactName': instance.contactName,
      'contactTel': instance.contactTel,
      'ctime': instance.ctime,
      'etime': instance.etime,
      'legs': instance.legs,
      'orderType': instance.orderType,
      'recevieStation': instance.recevieStation,
      'recevieTime': instance.recevieTime,
      'remark': instance.remark,
      'startStation': instance.startStation,
      'startTime': instance.startTime,
      'state': instance.state,
      'stateName': instance.stateName,
      'ticketOrders': instance.ticketOrders,
      'title': instance.title,
      'totalFacePrice': instance.totalFacePrice,
      'totalOtherFee': instance.totalOtherFee,
      'totalPayCash': instance.totalPayCash,
      'totalPurPrice': instance.totalPurPrice,
      'totalRefundAmount': instance.totalRefundAmount,
      'totalRefundFee': instance.totalRefundFee,
      'totalSalePrice': instance.totalSalePrice,
      'tplId': instance.tplId,
      'tradeNo': instance.tradeNo,
      'trainNo': instance.trainNo
    };
