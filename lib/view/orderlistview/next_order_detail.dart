import 'package:flutter/material.dart';
import 'package:airport_app/model/TicketTrade.dart';
import 'package:airport_app/service/orderdetail_Dao.dart';
import 'package:airport_app/utils/constants.dart';
class NextOrderDetailView extends StatefulWidget{

  final TicketTrade ticketTrade;
  NextOrderDetailView({Key key,@required this.ticketTrade}):super(key:key);
  _NextOrderDetailViewState createState()=> _NextOrderDetailViewState();
}

class _NextOrderDetailViewState extends State<NextOrderDetailView>{

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '待支付',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){
          Navigator.pop(context);
        }),
      ),
      
      body: ListView(
        children: <Widget>[

          Container(
            child: Container(
              color: Colors.grey.shade300,
              height: 230,
              margin: EdgeInsets.only(left: 5.0, right: 5.0, top: 0.0,bottom: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 40.0,
                    color: Colors.white,
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.flight_takeoff,color: Colors.blue,),
                        SizedBox(width: 5.0,),
                        Text(widget.ticketTrade.trainNo,style: TextStyle(fontWeight: FontWeight.bold),),
                        SizedBox(width: 5.0,),
                        Text(widget.ticketTrade.title,style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(width: 35.0,),
                        Text('￥${widget.ticketTrade.totalPayCash.toString()}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red)),
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 5.0,
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          "${widget.ticketTrade.trainNo}",
                          style: TextStyle(fontSize: 20.0, color: Colors.black),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              IconData(0xe62c,
                                  fontFamily: Constants.IconFontFamily),
                              size: 15.0,
                              color: Colors.orange,
                            ),
                            Text(widget.ticketTrade.startStation),
                            Text(widget.ticketTrade.startTime),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              IconData(0xe639,
                                  fontFamily: Constants.IconFontFamily),
                              color: Colors.green,
                              size: 25.0,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              IconData(0xe62f,
                                  fontFamily: Constants.IconFontFamily),
                              size: 15.0,
                              color: Colors.green,
                            ),
                            Text(widget.ticketTrade.recevieStation),
                            Text(widget.ticketTrade.recevieTime),
                          ],
                        ),
                      ),
                    ],
                  ),
                  //分割线
                  Container(
                    padding: EdgeInsets.only(top: 5.0),
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                            width: Constants.DividerWith,
                            color: Color(AppColors.DividerColor),
                          )),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 5.0,
                      ),
                      Text("订单号:"),
                      Text(
                        "${widget.ticketTrade.tradeNo}",
                        style: TextStyle(color: Colors.green),
                      ),
                      SizedBox(
                        width: 50.0,
                      ),
                      Text("${widget.ticketTrade.billState==0?'未支付':'已支付'}",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                    ],
                  ),

                  SizedBox(height: 5.0,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            width: 5.0,
                          ),
                          //Text("联系人:"),
                          Text(
                            "${widget.ticketTrade.contactName}",
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(
                            width: 50.0,
                          ),
                          Text("${widget.ticketTrade.contactTel}",style: TextStyle(color: Colors.black,),),
                        ],
                      ),
                      SizedBox(height: 5.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            width: 5.0,
                          ),
                          Text("发车时间:"),
                          Text(
                            "${widget.ticketTrade.startTime}",
                            style: TextStyle(color: Colors.green),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          //Text("${widget.ticketTrade.totalRefundAmount}"),
                        ],
                      ),

                      SizedBox(height: 5.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            width: 5.0,
                          ),
                          Text("订单创建时间:"),
                          Text(
                            "${widget.ticketTrade.ctime}",
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text("${widget.ticketTrade.stateName}",style: TextStyle(color: Colors.red),),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 5.0,),
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    alignment: Alignment.centerLeft,
                    height: 35.0,
                    color: Colors.white,
                    child: Text(widget.ticketTrade.remark,style: TextStyle(color: Colors.red,),overflow: TextOverflow.fade,),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  
}