import 'package:json_annotation/json_annotation.dart';
import 'OInsurance.dart';
part 'TicketOrder.g.dart';

@JsonSerializable()
class TicketOrder extends Object {//with $TicketOrderSerializerMixin

  /**
   * 票面价格，商品面值
   */
   num facePrice;

  /**
   * 费用明细
   */
   String feeDetail;

  /**
   * 证件号码
   */
   String idcardNo;

  /**
   * 证件类型 0：身份证
   */
   int idcardType;

  /**
   * 保险信息
   */
   OInsurance insurance;

  /**
   * 商品编号
   */
   String itemId;

  /**
   * 商品单号
   */

   String orderNo;

  /**
   * 其它费用总和(火车票：如资源方附加费；飞机票：如燃油附加费)
   */

   num otherFee;

  /**
   * 乘客姓名
   */
   String passengerName;

  /**
   * 乘客号码
   */
   String passengerTel;

  /**
   * 实际支付的金额
   */
   num payCash;

  /**
   * 实际票价，实际网点的采购价
   */
   num purPrice;

  /**
   * 退款手续费
   */

   num refundFee;

  /**
   * 销售订单号, 以S开头
   */

   String saleOrderNo;

  /**
   * 销售金额
   */
   num salePrice;

  /**
   * 出票以后的座次详情
   */

   String seatInfo;

  /**
   * 座位类型名称
   */
   String seatName;

  /**
   * 座位类型 0:二等座 1:一等座 2:特等座 3:商务座 4:无座 5:硬座 6:软座 7:硬卧 8:软卧; 9:高级软卧 10:火车其他座11:经济舱  12:头等舱; 21:汽车座位
   */

   int seatType;

  /**
   * 订单展示状态 0:交易中,9:出票失败,1:出票成功,6:退票中,7:退票失败,10:已退票,11:已退款
   */
   int state;

  /**
   * 订单展示状态 0:交易中,9:出票失败,1:出票成功,6:退票中,7:退票失败,10:已退票,11:已退款
   */
   String stateName;

  /**
   * 车票号码
   */

   String ticketNo;

  /**
   * 票务类型  0:成人票  1:儿童票  2:学生票
   */
   int ticketType;

  /**
   * 订单标题
   */
   String title;

  /**
   * 实际差额退款金额
   */
   num totalRefundAmount;


   TicketOrder(this.facePrice, this.feeDetail, this.idcardNo, this.idcardType,
       this.insurance, this.itemId, this.orderNo, this.otherFee,
       this.passengerName, this.passengerTel, this.payCash, this.purPrice,
       this.refundFee, this.saleOrderNo, this.salePrice, this.seatInfo,
       this.seatName, this.seatType, this.state, this.stateName, this.ticketNo,
       this.ticketType, this.title, this.totalRefundAmount);


   @override
   String toString() {
     return 'TicketOrder{facePrice: $facePrice, feeDetail: $feeDetail, idcardNo: $idcardNo, idcardType: $idcardType, insurance: $insurance, itemId: $itemId, orderNo: $orderNo, otherFee: $otherFee, passengerName: $passengerName, passengerTel: $passengerTel, payCash: $payCash, purPrice: $purPrice, refundFee: $refundFee, saleOrderNo: $saleOrderNo, salePrice: $salePrice, seatInfo: $seatInfo, seatName: $seatName, seatType: $seatType, state: $state, stateName: $stateName, ticketNo: $ticketNo, ticketType: $ticketType, title: $title, totalRefundAmount: $totalRefundAmount}';
   }

   factory TicketOrder.fromJson(Map<String, dynamic> json) =>
       _$TicketOrderFromJson(json);

   Map<String, dynamic> toJson() => _$TicketOrderToJson(this);
}