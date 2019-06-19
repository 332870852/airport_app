import 'package:json_annotation/json_annotation.dart';
import 'TicketOrders.dart';
part 'TicketTrade.g.dart';

@JsonSerializable()
class TicketTrade extends Object {
  //with $TicketTradeSerializerMixin

  /**
   * 支付状态 0：未支付，1：已支付
   */
  int billState;

  /**
   * 支付时间
   */
  String billTime;

  /**
   * 联系人
   */
  String contactName;

  /**
   * 联系人电话
   */

  String contactTel;

  /**
   * 订单创建时间
   */
  String ctime;

  /**
   * 完成时间
   */
  String etime;

  /**
   * 航段
   */

  String legs;

  /**
   * 票务类型  1:火车票  2:飞机票  3:汽车票
   */

  int orderType;

  /**
   * 抵达站
   */

  String recevieStation;

  /**
   * 到站时间
   */

  String recevieTime;

  /**
   * 备注,预订失败时，会展示失败原因
   */

  String remark;

  /**
   * 出发站
   */

  String startStation;

  /**
   * 发车时间
   */

  String startTime;

  /**
   * 订单状态：0：预定完成,2：预定中，1：已完成，9：已取消
   */

  int state;

  /**
   * 0：预定中,2：预定完成，1：已完成，9：已取消
   */
  String stateName;

  /**
   * 商品子单
   */

  TicketOrders ticketOrders;

  /**
   * 订单标题
   */

  String title;

  /**
   * 票面价，商品面值
   */

  num totalFacePrice;

  /**
   * 其它费用总和(火车票：如资源方附加费；飞机票：如燃油附加费)
   */

  num totalOtherFee;

  /**
   * 实际支付的金额
   */

  num totalPayCash;

  /**
   * 实际票价，实际网点的采购价
   */
  num totalPurPrice;

  /**
   * 实际差额退款金额
   */

  num totalRefundAmount;

  /**
   * 退款手续费总和
   */

  num totalRefundFee;

  /**
   * 建议零售价
   */

  num totalSalePrice;

  /**
   * 发货模板编号
   */
  String tplId;

  /**
   * 订单编号
   */
  String tradeNo;

  /**
   * 车次
   */
  String trainNo;


  TicketTrade(this.billState, this.billTime, this.contactName, this.contactTel,
      this.ctime, this.etime, this.legs, this.orderType, this.recevieStation,
      this.recevieTime, this.remark, this.startStation, this.startTime,
      this.state, this.stateName, this.ticketOrders, this.title,
      this.totalFacePrice, this.totalOtherFee, this.totalPayCash,
      this.totalPurPrice, this.totalRefundAmount, this.totalRefundFee,
      this.totalSalePrice, this.tplId, this.tradeNo, this.trainNo);


  @override
  String toString() {
    return 'TicketTrade{billState: $billState, billTime: $billTime, contactName: $contactName, contactTel: $contactTel, ctime: $ctime, etime: $etime, legs: $legs, orderType: $orderType, recevieStation: $recevieStation, recevieTime: $recevieTime, remark: $remark, startStation: $startStation, startTime: $startTime, state: $state, stateName: $stateName, ticketOrders: $ticketOrders, title: $title, totalFacePrice: $totalFacePrice, totalOtherFee: $totalOtherFee, totalPayCash: $totalPayCash, totalPurPrice: $totalPurPrice, totalRefundAmount: $totalRefundAmount, totalRefundFee: $totalRefundFee, totalSalePrice: $totalSalePrice, tplId: $tplId, tradeNo: $tradeNo, trainNo: $trainNo}';
  }

  factory TicketTrade.fromJson(Map<String, dynamic> json) =>
      _$TicketTradeFromJson(json);

  Map<String, dynamic> toJson() => _$TicketTradeToJson(this);

}