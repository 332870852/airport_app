import 'package:json_annotation/json_annotation.dart';

part 'AirSeat.g.dart';

@JsonSerializable()
class AirSeat extends Object {//with $AirSeatSerializerMixin
  /**
   * 航空公司编号，二字码
   */

  String airlineCode;

  /**
   * 改期临界时间之后需要的改期费用
   */

  double changePercentAfter;

  /**
   * 改期临界时间之前需要的改期费用
   */

  double changePercentBefore;

  /**
   * 改期费提示说明
   */

  String changeStipulate;

  /**
   * 改期临界时间
   */

  int changeTimePoint;

  /**
   * 返现
   */

  double commisionMoney;

  /**
   * 政策返点
   */

  String commisionPoint;

  /**
   * 折扣
   */

  double discount;

  /**
   * 标识 退改签政策 是否在后台已经查询到
   */

  bool hasQueryedStipulate;

  /**
   * 票面价，即界面展示价格，打折后价格
   */

  int parPrice;

  /**
   * 政策的ID
   */

  int policyId;

  /**
   * 起飞后退票费率
   */

  double refundPercentAfter;

  /**
   * 起飞前退票费率
   */

  double refundPercentBefore;

  /**
   * 退票规定
   */

  String refundStipulate;

  /**
   * 起飞前退票时间点
   */

  int refundTimePoint;

  /**
   * 舱位码
   */

  String seatCode;

  /**
   * 舱位  （经济舱;  超级经济舱;   头等舱  ）
   */

  String seatMsg;

  /**
   * 当可用坐席大于9时用"A"表示；当小于等于9时，显示确切的可用坐席数；
   */

  String seatStatus;

  /**
   * 服务级别 （若是要取舱位类型，直接取seatMsg，不要取次字段，保存的时候也是保存seatMsg）
   */

  String serviceLevel;

  /**
   * 成人的结算价，实际需要支付的价格
   */

  double settlePrice;

  /**
   * CY充值模板的舱位key
   */

  String verifyKey;

  /**
   * 废票时间
   */

  String vtWorkTime;

  /**
   * 供应商工作时间
   */

  String workTime;

  AirSeat(this.airlineCode, this.changePercentAfter, this.changePercentBefore,
      this.changeStipulate, this.changeTimePoint, this.commisionMoney,
      this.commisionPoint, this.discount, this.hasQueryedStipulate,
      this.parPrice, this.policyId, this.refundPercentAfter,
      this.refundPercentBefore, this.refundStipulate, this.refundTimePoint,
      this.seatCode, this.seatMsg, this.seatStatus, this.serviceLevel,
      this.settlePrice, this.verifyKey, this.vtWorkTime, this.workTime);

  @override
  String toString() {
    return 'AirSeat{airlineCode: $airlineCode, changePercentAfter: $changePercentAfter, changePercentBefore: $changePercentBefore, changeStipulate: $changeStipulate, changeTimePoint: $changeTimePoint, commisionMoney: $commisionMoney, commisionPoint: $commisionPoint, discount: $discount, hasQueryedStipulate: $hasQueryedStipulate, parPrice: $parPrice, policyId: $policyId, refundPercentAfter: $refundPercentAfter, refundPercentBefore: $refundPercentBefore, refundStipulate: $refundStipulate, refundTimePoint: $refundTimePoint, seatCode: $seatCode, seatMsg: $seatMsg, seatStatus: $seatStatus, serviceLevel: $serviceLevel, settlePrice: $settlePrice, verifyKey: $verifyKey, vtWorkTime: $vtWorkTime, workTime: $workTime}';
  }


  factory AirSeat.fromJson(Map<String, dynamic> json) =>
      _$AirSeatFromJson(json);

  Map<String, dynamic> toJson() => _$AirSeatToJson(this);

}
