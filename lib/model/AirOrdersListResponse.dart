import 'package:json_annotation/json_annotation.dart';
import '../model/TicketTrade.dart';
part 'AirOrdersListResponse.g.dart';
@JsonSerializable()
class AirOrdersListResponse extends Object{// with $AirOrdersListResponseSerializerMixin

  /**
   * 页码，从0开始
   */
   int pageNo;

  /**
   * 单页返回的记录数，默认10
   */

   int pageSize;

  /**
   * 订单详情
   */

   List<TicketTrade> ticketTrades;

  /**
   * 总记录数
   */

   int totolCount;

   AirOrdersListResponse(this.pageNo, this.pageSize, this.ticketTrades,
       this.totolCount);

   @override
   String toString() {
     return 'AirOrdersListResponse{pageNo: $pageNo, pageSize: $pageSize, ticketTrades: $ticketTrades, totolCount: $totolCount}';
   }


  factory AirOrdersListResponse.fromJson(Map<String, dynamic> json) =>
  _$AirOrdersListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AirOrdersListResponseToJson(this);
}