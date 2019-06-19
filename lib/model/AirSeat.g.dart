// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AirSeat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirSeat _$AirSeatFromJson(Map<String, dynamic> json) {
  return AirSeat(
      json['airlineCode'] as String,
      (json['changePercentAfter'] as num)?.toDouble(),
      (json['changePercentBefore'] as num)?.toDouble(),
      json['changeStipulate'] as String,
      json['changeTimePoint'] as int,
      (json['commisionMoney'] as num)?.toDouble(),
      json['commisionPoint'] as String,
      (json['discount'] as num)?.toDouble(),
      json['hasQueryedStipulate'] as bool,
      json['parPrice'] as int,
      json['policyId'] as int,
      (json['refundPercentAfter'] as num)?.toDouble(),
      (json['refundPercentBefore'] as num)?.toDouble(),
      json['refundStipulate'] as String,
      json['refundTimePoint'] as int,
      json['seatCode'] as String,
      json['seatMsg'] as String,
      json['seatStatus'] as String,
      json['serviceLevel'] as String,
      (json['settlePrice'] as num)?.toDouble(),
      json['verifyKey'] as String,
      json['vtWorkTime'] as String,
      json['workTime'] as String);
}

Map<String, dynamic> _$AirSeatToJson(AirSeat instance) => <String, dynamic>{
      'airlineCode': instance.airlineCode,
      'changePercentAfter': instance.changePercentAfter,
      'changePercentBefore': instance.changePercentBefore,
      'changeStipulate': instance.changeStipulate,
      'changeTimePoint': instance.changeTimePoint,
      'commisionMoney': instance.commisionMoney,
      'commisionPoint': instance.commisionPoint,
      'discount': instance.discount,
      'hasQueryedStipulate': instance.hasQueryedStipulate,
      'parPrice': instance.parPrice,
      'policyId': instance.policyId,
      'refundPercentAfter': instance.refundPercentAfter,
      'refundPercentBefore': instance.refundPercentBefore,
      'refundStipulate': instance.refundStipulate,
      'refundTimePoint': instance.refundTimePoint,
      'seatCode': instance.seatCode,
      'seatMsg': instance.seatMsg,
      'seatStatus': instance.seatStatus,
      'serviceLevel': instance.serviceLevel,
      'settlePrice': instance.settlePrice,
      'verifyKey': instance.verifyKey,
      'vtWorkTime': instance.vtWorkTime,
      'workTime': instance.workTime
    };
