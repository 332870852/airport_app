import 'package:flutter/material.dart';
import 'package:airport_app/utils/constants.dart';
import 'package:airport_app/service/orderdetail_Dao.dart';
import 'next_order_detail.dart';
import 'package:airport_app/model/Response_exception.dart';
import 'package:airport_app/utils/TicketDb.dart';
import 'finish_order_detail.dart';

class OrderDetailView extends StatefulWidget{

  _OrderDetailViewState createState()=>_OrderDetailViewState();
}

class _OrderDetailViewState extends State<OrderDetailView>{
  TicketInfoProvider _ticketInfoProvider;

  @override
  void initState() {
    _ticketInfoProvider=new TicketInfoProvider();
  }

  Future _openAlertDialog(String msg)  async{
    final action = await showDialog(
        barrierDismissible: false, //必须选择一个才能关闭
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              child: Text(
                '温馨提示',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
            ),
            content: Text(
              msg,
              style: TextStyle(color: Colors.grey, fontSize: 20.0),
            ),
            actions: <Widget>[
              RaisedButton(
                color: Colors.blue,
                child: Text(
                  '确定',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '订单',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0.0,
        centerTitle: true,
      ),

      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10.0),
            alignment: Alignment.centerLeft,
            height: 35.0,
            child: Text(
              '飞机票订单',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: Color(AppColors.DividerColor),
                        width: Constants.DividerWith)),
                color: Colors.grey.shade200),
          ),
          Container(
            height: 70.0,
            margin: EdgeInsets.only(top: 2.0,bottom: 6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(IconData(0xe6c8,fontFamily: Constants.IconFontFamily,),color: Colors.blue,size: 25.0,),
                      onPressed: ()async{///查询待支付
                        List<TicketInfo> tickets=await _ticketInfoProvider.getAll().catchError((onError){
                          print(onError);
                        });
                        if(tickets==null){
                          _openAlertDialog('无数据');
                          return null;
                        }
                        var data=await fetchOrderdetail(tradeNo: tickets[0].tradeNo).catchError((onError){
                          ResponseException resp=onError;
                          return _openAlertDialog(resp.subErrors[0].message);
                        });
                       if(data.state==1){///1-已完成
                         return _openAlertDialog('不存在待支付的订单');
                       }
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext ctx){
                          return NextOrderDetailView(ticketTrade: data,);
                        }));
                      },
                    ),
                    Text('待支付',style: TextStyle(color: Colors.blue),)
                  ],
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(IconData(0xe603,fontFamily: Constants.IconFontFamily),color: Colors.blue,size: 28.0,),
                      onPressed: ()async{
                        ///查询
                      /* var data= await fetchOrderdetail(tradeNo: 'T190304162949363').catchError((onError){
                         ResponseException resp=onError;
                         return _openAlertDialog(resp.subErrors[0].message);
                       });
                        if(data.state==1||data.state==2){///1-已完成, ///2- 预订完成
                          //print("*********${data}");
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext ctx){
                            return Finsh_OrderDetail(ticketTrade: data,);
                          }));
                        }*/
                        ///////////////////////////////
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext ctx){
                          return Finsh_OrderDetail(ticketTrade: null,);
                        }));
                      },
                    ),
                    Text('已支付',style: TextStyle(color: Colors.blue),)
                  ],
                ),

              ],
            ),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: Color(AppColors.DividerColor),
                        width: Constants.DividerWith)),
                color: Colors.white),
          ),
        ],
      ),
    );
  }



}