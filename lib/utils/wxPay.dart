import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:airport_app/model/paymodel/PayResult.dart';

final String token = "0e843b5b60ffc81f7cbce7e54b2645eb";

//WXpay() async {
//  PayResult payResult = await getunifiedOrder();
//
////Fluwx fluwx=new Fluwx();
//  fluwx.register(appId: payResult.appid,doOnAndroid: true,doOnIOS: true);
//
//  fluwx.WeChatPayModel payModel = fluwx.WeChatPayModel(
//      appId: payResult.appid,
//      partnerId: payResult.partnerid,
//      prepayId: payResult.prepayid,
//      packageValue: payResult.packageValue,
//      nonceStr: payResult.noncestr,
//      timeStamp: int.parse(payResult.timestamp),
//      sign: payResult.sign);
//  fluwx.WeChatPaymentResponse paymentResponse= await fluwx.pay(payModel).then((onValue){
//    print("pay: ${onValue}");
//  }).catchError((onError){
//    print("onError: ${onError}");
//  });
//
//  print("*********pay: ${paymentResponse}");
//  fluwx.responseFromPayment.listen((onData){
//    print("*********onData: ${onData}");
//  });
//
//  fluwx.isWeChatInstalled().then((onValue){
//    print("************onValue: ${onValue}");
//  });
///*
//fluwx.pay(WeChatPayModel(appId: 'wxdb37a12fccb069e9',
//    partnerId: '1511730201',
//    prepayId: null,
//    packageValue: 'Sign=WXPay',
//    nonceStr: 'griovsdsssssewwee437ggg8090vcvxc',
//    timeStamp: int.parse(DateTime.now().toIso8601String()),
// sign: null));
//*/
//}
//
///***
// * 调用微信统一下单接口
// * return PayResult
// */
//Future<PayResult> getunifiedOrder() async {
//  Dio dio = new Dio();
//  Response response;
//
//  ///header
//  dio.options.headers['token'] = token;
//
//  ///提交表单数据
//  FormData formData = new FormData.from({});
//  formData.putIfAbsent('body', () => 'test');
//  formData.putIfAbsent('out_trade_no', () => '111100');
//  formData.putIfAbsent('total_fee', () => '1');
//
//  try {
//    response = await dio.post(
//        'http://121.14.110.78:38886/order/wxpay/unifiedOrder',
//        data: formData, onUploadProgress: (int send, int total) {
//      print("send: ${send},total: ${total}");
//    });
//    if (response.statusCode == 200) {
//      // print("###${response.data['result']}");
//      PayResult payResult = PayResult.fromJson(response.data['result']);
//      // print("***${payResult}");
//      return payResult;
//    } else {
//      print('code: ${response.statusCode},data:${response.data}');
//    }
//  } catch (e) {
//    print("post*********$e");
//    throw e;
//  }
//}
//
//class test extends StatefulWidget {
//  _testState createState() => _testState();
//}
//
//class _testState extends State<test> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Center(
//        child: FlatButton(
//            onPressed: () {
//              WXpay();
//            },
//            child: Text('支付')),
//      ),
//    );
//  }
//}
