// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Airline.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Airline _$AirlineFromJson(Map<String, dynamic> json) {
  return Airline(
      (json['adultAirportTax'] as num)?.toDouble(),
      (json['adultFuelTax'] as num)?.toDouble(),
      json['airSeats'] == null
          ? null
          : AirSeats.fromJson(json['airSeats'] as Map<String, dynamic>),
      json['arriTime'] as String,
      (json['basePrice'] as num)?.toDouble(),
      json['depTime'] as String,
      json['dstCity'] as String,
      json['dstCityName'] as String,
      json['flightCompanyCode'] as String,
      json['flightCompanyName'] as String,
      json['flightNo'] as String,
      json['orgCity'] as String,
      json['orgCityName'] as String,
      json['planeType'] as String);
}

Map<String, dynamic> _$AirlineToJson(Airline instance) => <String, dynamic>{
      'adultAirportTax': instance.adultAirportTax,
      'adultFuelTax': instance.adultFuelTax,
      'airSeats': instance.airSeats,
      'arriTime': instance.arriTime,
      'basePrice': instance.basePrice,
      'depTime': instance.depTime,
      'dstCity': instance.dstCity,
      'dstCityName': instance.dstCityName,
      'flightCompanyCode': instance.flightCompanyCode,
      'flightCompanyName': instance.flightCompanyName,
      'flightNo': instance.flightNo,
      'orgCity': instance.orgCity,
      'orgCityName': instance.orgCityName,
      'planeType': instance.planeType
    };
