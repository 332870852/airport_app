import 'package:json_annotation/json_annotation.dart';

part 'Station.g.dart';
@JsonSerializable()

/**
 * 站点详细信息
 */
class Station extends Object {//with $StationSerializerMixin
  /**
   * 站点代码
   */
  String code;
  /**
   * 短拼
   */

  String duanpin;

  /**
   * 中文名
   */

  String name;

  /**
   * 全拼
   */
  String quanpin;

  Station(this.code, this.duanpin, this.name, this.quanpin);

  @override
  String toString() {
    return 'Station{code: $code, duanpin: $duanpin, name: $name, quanpin: $quanpin}';
  }

  factory Station.fromJson(Map<String, dynamic> json) =>
      _$StationFromJson(json);

  Map<String, dynamic> toJson() => _$StationToJson(this);

}
