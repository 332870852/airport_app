import 'package:flutter/material.dart';
import '../utils/http_util.dart';
import '../model/TicketTrade.dart';
import '../model/Response_exception.dart';

/**
 * seatCode   舱位编码   Y
 * passagers  乘客信息,以英文逗号分隔,依次为：乘客姓名,乘客手机号码,乘客证件号码,多个乘客时以英文分号分隔，同一笔订单最多支持五个乘客
 *            张三,13585189468,34022219900105662X;李四,13585189468,430703198709128516
 * itemId     选择的飞机票标准商品编号  5510901
 * contactName    订票联系人  张三
 * contactTel     联系电话    15888888888
 * date           出发日期    2015-08-24
 * from           起飞站点(机场)三字码
 * to             抵达站点(机场)三字码
 * companyCode    航空公司编码
 * flightNo       航班号
 */
Future<TicketTrade> PaypayBill(
    {@required seatCode,
    @required passagers,
    @required itemId,
    @required contactName,
    @required contactTel,
    @required date,
    @required from,
    @required to,
    @required companyCode,
    @required flightNo}) async {
  Map<String, String> reqMap = new Map();
  reqMap.putIfAbsent('seatCode', () => seatCode);
  reqMap.putIfAbsent('passagers', () => passagers);
  reqMap.putIfAbsent('itemId', () => itemId);
  reqMap.putIfAbsent('contactName', () => contactName);
  reqMap.putIfAbsent('contactTel', () => contactTel);
  reqMap.putIfAbsent('date', () => date);
  reqMap.putIfAbsent('from', () => from);
  reqMap.putIfAbsent('to', () => to);
  reqMap.putIfAbsent('companyCode', () => companyCode);
  reqMap.putIfAbsent('flightNo', () => flightNo);
  var ResponseData =
      await post(method: 'qianmi.elife.air.order.payBill', requestmap: reqMap);
  TicketTrade ticketTrade;
  var responseBody;
  try {
    //print(ResponseData);
    responseBody = ResponseData.data['air_order_pay_response']['ticketTrade'];
    if (responseBody == null) {
      return null;
    }
    ticketTrade = TicketTrade.fromJson(responseBody);
    //print('aa: $ticketTrade');
    return ticketTrade;
  } catch (e) {
    //print('responseBody e: $e');
    try {
      responseBody =
          ResponseData.data['air_order_detail_response']['ticketTrade'];
      ticketTrade = TicketTrade.fromJson(responseBody);
     // print('````*****```````${ticketTrade}');
      return ticketTrade;
    } catch (e1) {
      print('responseBody e1: $e');
      ResponseException responseException =
          ResponseException.fromJson(ResponseData.data);
      throw responseException;
    }
  }
}
