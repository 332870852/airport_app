import 'package:json_annotation/json_annotation.dart';
part 'OInsurance.g.dart';
/**
 * 保单信息
 */
@JsonSerializable()
class OInsurance extends Object {//with $OInsuranceSerializerMixin
  /**
   * 票面价
   */
   num facePrice;

  /**
   * 保单信息
   */
   String insuranceInfo;

  /**
   * 保险单订单号
   */
   String insuranceNo;

  /**
   * 保险单号,支付购买成功后展示
   */
   String insurancePolicyNo;

  /**
   * 商品编号
   */
   String itemId;

  /**
   * 实际支付的金额
   */
   num payCash;

  /**
   * 实际票价，实际网点的采购价
   */
   num purPrice;

  /**
   * 销售订单号
   */
   String saleOrderNo;

  /**
   * 建议零售价
   */
   String salePrice;

  /**
   * 订单展示状态 0:交易中,9:出票失败,1:出票成功,6:退票中,7:退票失败,10:已退票,11:已退款
   */
   int state;

  /**
   * 用户姓名
   */
   String userName;

  /**
   * 用户号码
   */
   String userTel;


   OInsurance(this.facePrice, this.insuranceInfo, this.insuranceNo,
       this.insurancePolicyNo, this.itemId, this.payCash, this.purPrice,
       this.saleOrderNo, this.salePrice, this.state, this.userName,
       this.userTel);


   @override
   String toString() {
     return 'OInsurance{facePrice: $facePrice, insuranceInfo: $insuranceInfo, insuranceNo: $insuranceNo, insurancePolicyNo: $insurancePolicyNo, itemId: $itemId, payCash: $payCash, purPrice: $purPrice, saleOrderNo: $saleOrderNo, salePrice: $salePrice, state: $state, userName: $userName, userTel: $userTel}';
   }

   factory OInsurance.fromJson(Map<String, dynamic> json) =>
       _$OInsuranceFromJson(json);

   Map<String, dynamic> toJson() => _$OInsuranceToJson(this);

}