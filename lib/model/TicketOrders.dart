import 'TicketOrder.dart';
import 'package:json_annotation/json_annotation.dart';
part 'TicketOrders.g.dart';

@JsonSerializable()
class TicketOrders extends Object {//with $TicketOrdersSerializerMixin

  List<TicketOrder> ticketOrder;

  TicketOrders(this.ticketOrder);

  factory TicketOrders.fromJson(Map<String, dynamic> json) =>
      _$TicketOrdersFromJson(json);

  Map<String, dynamic> toJson() => _$TicketOrdersToJson(this);

  @override
  String toString() {
    return 'TicketOrders{ticketOrder: $ticketOrder}';
  }

}