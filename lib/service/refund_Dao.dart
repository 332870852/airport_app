import 'package:flutter/material.dart';
import '../model/AirOrderRefundResponse.dart';
import '../utils/http_util.dart';
import '../model/Response_exception.dart';

///tradeNo   订单主编号      T150813161105440
///returnType 退票类型:3-退票   3
///orderNos   订单子单编号集合  "P141222161001880","P141222161001880"
///
Future<String> fetchAirOrderRefund({String tradeNo,String returnType,String orderNos}) async{

  Map<String, String> reqMap = new Map();
  reqMap.putIfAbsent('tradeNo', () => tradeNo); //'PEK'
  reqMap.putIfAbsent('returnType', () => returnType); //'CAN'
  reqMap.putIfAbsent('orderNos', () => orderNos); //'2019-02-05'

  var ResponseData =
      await get(method: 'qianmi.elife.air.order.refund', requestmap: reqMap);
  try {
//print(ResponseData);
    var responseBody = ResponseData.data['air_order_refund_response'];

    String result= responseBody = responseBody['result'];
    print("***${result}");

//print('aa: $stations');
    return result;
  } catch (e) {
    print('responseBody Exception: $e');
    ResponseException responseException =
    ResponseException.fromJson(ResponseData.data);
    throw responseException.subErrors[0].message;
  }

}