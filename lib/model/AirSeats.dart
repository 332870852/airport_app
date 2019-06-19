import 'package:json_annotation/json_annotation.dart';
import 'AirSeat.dart';
part 'AirSeats.g.dart';
@JsonSerializable()
class AirSeats extends Object{//with $AirSeatsSerializerMixin

  List<AirSeat> airSeat;

  AirSeats(this.airSeat);

  @override
  String toString() {
    return 'AirSeats{airSeat: $airSeat}';
  }

  factory AirSeats.fromJson(Map<String, dynamic> json) =>
      _$AirSeatsFromJson(json);

  Map<String, dynamic> toJson() => _$AirSeatsToJson(this);
}