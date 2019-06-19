import 'package:flutter/material.dart';
import '../model/Response_exception.dart';
import '../model/Airline.dart';
import '../utils/http_util.dart';

//基础数据

Future<List<Airline>> fetchAirlines(
    {@required from, @required to, @required date, @required itemId}) async {
  Map<String, String> reqMap = new Map();
  reqMap.putIfAbsent('from', () => from); //'PEK'
  reqMap.putIfAbsent('to', () => to); //'CAN'
  reqMap.putIfAbsent('date', () => date); //'2019-02-05'
  reqMap.putIfAbsent('itemId', () => itemId); //'5500301'
  var ResponseData =
      await get(method: 'qianmi.elife.air.lines.list', requestmap: reqMap);
  List<Airline> airlines;
  try {
//print(ResponseData);
    var responseBody = ResponseData.data['airlines_list_response']['airlines'];
    if (responseBody == null) {
      return null;
    }
    responseBody = responseBody['airline'];
    //print(responseBody);
    airlines =
        responseBody.map<Airline>((item) => Airline.fromJson(item)).toList();
//print('aa: $stations');
    return airlines;
  } catch (e) {
    print('responseBody Exception: $e');

    ResponseException responseException =
        ResponseException.fromJson(ResponseData.data);
    throw '错误代码:(${responseException.code}),messager:${responseException.message},solution:${responseException.solution}';
  }
}
