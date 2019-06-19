import '../utils/http_util.dart';
import '../model/TicketTrade.dart';
import '../model/Response_exception.dart';
import 'package:flutter/material.dart';

/// qianmi.elife.air.order.detail（查看整笔订单详情）
///

/// tradeNo  订单主编号  T141218161001726
Future<TicketTrade> fetchOrderdetail({String tradeNo}) async{

  Map<String, String> reqMap = new Map();
  reqMap.putIfAbsent('tradeNo', () => tradeNo);

  var ResponseData =
      await get(method: 'qianmi.elife.air.order.detail', requestmap: reqMap);
  TicketTrade ticketTrade;
  var responseBody;
  try{
     responseBody= ResponseData.data['air_order_detail_response']['ticketTrade'];

    // print(responseBody);
     ticketTrade= TicketTrade.fromJson(responseBody);
     //print(TicketTrade.fromJson(responseBody));
     return ticketTrade;
  }catch(e){
    print('responseBody Exception: $e');
    ResponseException responseException =
    ResponseException.fromJson(ResponseData.data);
    throw responseException;
  }

}







