import '../utils/http_util.dart';
import '../model/Station.dart';
import '../model/Response_exception.dart';
import 'package:flutter/material.dart';
import '../utils/constants.dart';

//基础数据
List<Station> stations;


Future<List<Station>> fetchStations() async{

  var ResponseData = await get(method: 'qianmi.elife.air.stations.list');
  List<Station> stations;
  try {
    final responseBody = ResponseData.data['air_stations_list_response']
    ['stations']['station'];
    stations =
        responseBody.map<Station>((item) => Station.fromJson(item)).toList();
    //print('aa: $stations');
    return stations;
  } catch (e) {
    print('responseBody Exception: $e');
    ResponseException responseException =
    ResponseException.fromJson(ResponseData.data);
    throw '错误代码:(${responseException.code}),messager:${responseException.message},solution:${responseException.solution}';
  }
}

const INDEX_BAR_WORDS = [
  "A", "B", "C", "D", "E", "F", "G",
  "H", "I", "J", "K", "L", "M", "N",
  "O", "P", "Q", "R", "S", "T", "U",
  "V", "W", "X", "Y", "Z"
];