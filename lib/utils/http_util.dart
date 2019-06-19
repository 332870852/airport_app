import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:crypto/crypto.dart';
import '../model/Item.dart';
import 'constants.dart';

String data;
/**
 * get请求
 */
Future<Response> get({@required String method, Map requestmap}) async {
  var url = serverUrl;
  Map<String, String> map = new Map();
  map.putIfAbsent('timestamp', () => new DateTime.now().toLocal().toString());
  map.putIfAbsent('access_token', () => acceessToken);
  //maps.putIfAbsent('method', () => 'qianmi.elife.air.item.detail');
  map.putIfAbsent('v', () => '1.1');
  map.putIfAbsent('format', () => 'json');
  map.putIfAbsent('method', () => method);
  /*client */
  //map.putIfAbsent('itemId', () => itemId);
  print(requestmap);
  if (requestmap!=null) {
    map.addAll(requestmap);
  }
  String sign = getSign(map);
  //print('sign: $sign');
  map.putIfAbsent('sign', () => sign);
  Response response;
  Dio dio = new Dio();
  try {
    /*response = await dio.get(url, data: {
      'method': map['method'],
      'v': map['v'],
      'access_token': map['access_token'],
      'format': map['json'],
      'itemId': '5500301',
      'timestamp': map['timestamp'], //new DateTime.now().toIso8601String()
      'sign': sign
    });*/
    response =  await dio.get(url, data: map);
    if (response.statusCode == 200) {

      data=response.data.toString();
      return response;
    } else {
      print('code: ${response.statusCode},data:${response.data}');
    }
  } catch (e) {
    print("get *********$e");
    throw e;
  }
  return null;
}

/**
 * post请求
 */

Future<Response> post({@required String method, Map requestmap}) async {
  var url = serverUrl;
  Map<String, String> map = new Map();
  map.putIfAbsent('timestamp', () => new DateTime.now().toLocal().toString());
  map.putIfAbsent('access_token', () => acceessToken);
  map.putIfAbsent('v', () => '1.1');
  map.putIfAbsent('format', () => 'json');
  map.putIfAbsent('method', () => method);
  FormData formData=new FormData();
  formData.addAll(map);
  debugPrint(requestmap.toString());
  if (requestmap!=null) {
    map.addAll(requestmap);
  }
 // print('**********: $map');
  String sign = getSign(map);
 // print('sign: $sign');
  map.putIfAbsent('sign', () => sign);
  Response response;
  Dio dio = new Dio();
  try {

    response =  await dio.get(url, data: formData);
    if (response.statusCode == 200) {
      data=response.data.toString();
      return response;
    } else {
      print('code: ${response.statusCode},data:${response.data}');
    }
  } catch (e) {
    print("post*********$e");
    throw e;
  }
  return null;
}


/**
 * 获取签名sign
 */
String getSign(Map<String, String> param) {
  if (param == null) {
    return null;
  }
  Map<String, String> maps = new Map();
  if (!param.isEmpty) {
    param.forEach((key, value) {
      maps.putIfAbsent(key, () => value);
    });
  }
  return sign(maps, appSecret);
}

/*

 */
String sign(Map<String, String> param, String secret) {
  if (param == null) {
    return null;
  }
  StringBuffer sb = new StringBuffer();
  List<String> paramNames = [];
  paramNames.addAll(param.keys);
  paramNames.sort();
  sb.write(secret);
  paramNames.forEach((paramName) {
    sb.write(paramName);
    sb.write(param[paramName]);
  });
  sb.write(secret);
  return my_sha1(sb.toString());
}

String my_sha1(String str) {
  return getSHA1Digest(str).toString().toUpperCase();
}

Digest getSHA1Digest(String data) {
  var result;
  try {
    var bytes = utf8.encode(data);
    result = sha1.convert(bytes);
  } catch (Exception) {
    print(Exception);
  }
  return result;
}
