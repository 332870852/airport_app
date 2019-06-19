import 'package:json_annotation/json_annotation.dart';
part 'PayResult.g.dart';
@JsonSerializable()
 class PayResult extends Object {//with $PayResultSerializerMixin

   String packageValue;
   String appid;
   String sign;
   String partnerid;
   String prepayid;
   String noncestr;
   String timestamp;

   PayResult(this.packageValue, this.appid, this.sign, this.partnerid,
       this.prepayid, this.noncestr, this.timestamp);


   @override
   String toString() {
     return 'PayResult{packageValue: $packageValue, appid: $appid, sign: $sign, partnerid: $partnerid, prepayid: $prepayid, noncestr: $noncestr, timestamp: $timestamp}';
   }

   factory PayResult.fromJson(Map<String, dynamic> json) =>
      _$PayResultFromJson(json);

  Map<String, dynamic> toJson() => _$PayResultToJson(this);
}