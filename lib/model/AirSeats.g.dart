// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AirSeats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirSeats _$AirSeatsFromJson(Map<String, dynamic> json) {
  return AirSeats((json['airSeat'] as List)
      ?.map(
          (e) => e == null ? null : AirSeat.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$AirSeatsToJson(AirSeats instance) =>
    <String, dynamic>{'airSeat': instance.airSeat};
