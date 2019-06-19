import 'package:json_annotation/json_annotation.dart';
import 'AirSeats.dart';
part 'Airline.g.dart';

@JsonSerializable()
class Airline extends Object {//with $AirlineSerializerMixin
  /**
   * 成人机建费
   */
  double adultAirportTax;

  /**
   * 成人燃油费
   */

  double adultFuelTax;

  /**
   * 航班舱位信息
   */
  AirSeats airSeats;

  /**
   * 降落时间
   */

  String arriTime;

  /**
   * Y舱价格，未打折的价格，该价格在前台不需要用
   */
  double basePrice;

  /**
   * 起飞时间
   */

  String depTime;

  /**
   * 抵达城市(机场)
   */
  String dstCity;

  /**
   * 抵达城市名称
   */

  String dstCityName;

  /**
   * 航空公司二字码
   */

  String flightCompanyCode;

  /**
   * 航空公司的名称
   */

  String flightCompanyName;

  /**
   * 航班号
   */

  String flightNo;

  /**
   * 起始城市(机场)
   */

  String orgCity;

  /**
   * 起始城市名称
   */
  String orgCityName;

  /**
   * 机型
   */

  String planeType;


  Airline(this.adultAirportTax, this.adultFuelTax, this.airSeats, this.arriTime,
      this.basePrice, this.depTime, this.dstCity, this.dstCityName,
      this.flightCompanyCode, this.flightCompanyName, this.flightNo,
      this.orgCity, this.orgCityName, this.planeType);


  @override
  String toString() {
    return 'Airline{adultAirportTax: $adultAirportTax, adultFuelTax: $adultFuelTax, airSeats: $airSeats, arriTime: $arriTime, basePrice: $basePrice, depTime: $depTime, dstCity: $dstCity, dstCityName: $dstCityName, flightCompanyCode: $flightCompanyCode, flightCompanyName: $flightCompanyName, flightNo: $flightNo, orgCity: $orgCity, orgCityName: $orgCityName, planeType: $planeType}';
  }
  getAirLineString(){
    return 'Airline{adultAirportTax: $adultAirportTax, adultFuelTax: $adultFuelTax, arriTime: $arriTime, basePrice: $basePrice, depTime: $depTime, dstCity: $dstCity, dstCityName: $dstCityName, flightCompanyCode: $flightCompanyCode, flightCompanyName: $flightCompanyName, flightNo: $flightNo, orgCity: $orgCity, orgCityName: $orgCityName, planeType: $planeType}';
  }

  factory Airline.fromJson(Map<String, dynamic> json) =>
      _$AirlineFromJson(json);

  Map<String, dynamic> toJson() => _$AirlineToJson(this);
}
