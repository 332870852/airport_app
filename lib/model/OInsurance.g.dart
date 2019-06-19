// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OInsurance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OInsurance _$OInsuranceFromJson(Map<String, dynamic> json) {
  return OInsurance(
      json['facePrice'] as num,
      json['insuranceInfo'] as String,
      json['insuranceNo'] as String,
      json['insurancePolicyNo'] as String,
      json['itemId'] as String,
      json['payCash'] as num,
      json['purPrice'] as num,
      json['saleOrderNo'] as String,
      json['salePrice'] as String,
      json['state'] as int,
      json['userName'] as String,
      json['userTel'] as String);
}

Map<String, dynamic> _$OInsuranceToJson(OInsurance instance) =>
    <String, dynamic>{
      'facePrice': instance.facePrice,
      'insuranceInfo': instance.insuranceInfo,
      'insuranceNo': instance.insuranceNo,
      'insurancePolicyNo': instance.insurancePolicyNo,
      'itemId': instance.itemId,
      'payCash': instance.payCash,
      'purPrice': instance.purPrice,
      'saleOrderNo': instance.saleOrderNo,
      'salePrice': instance.salePrice,
      'state': instance.state,
      'userName': instance.userName,
      'userTel': instance.userTel
    };
