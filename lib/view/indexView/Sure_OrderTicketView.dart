import 'package:airport_app/model/TicketTrade.dart';
import 'package:airport_app/utils/http_util.dart';
import 'package:airport_app/view/orderlistview/listview_ticketOrders.dart';
import 'package:airport_app/view/orderlistview/next_order_detail.dart';
import 'package:flutter/material.dart';
import 'package:airport_app/model/AirSeat.dart';
import 'package:airport_app/model/Airline.dart';
import 'package:airport_app/utils/constants.dart' show AppStyle, AppColors, Constants,banmaApi;
import 'package:airport_app/utils/nativeDb.dart';
import 'package:airport_app/view/orderlistview/order_itemAdd.dart';
import 'package:airport_app/utils/nativeDb.dart';
import 'package:airport_app/service/payBill_Dao.dart';
import 'package:airport_app/model/Response_exception.dart';
import 'package:airport_app/utils/TicketDb.dart';



class SureOrderTicketView extends StatefulWidget {
  final AirSeat airSeat;
  final Airline airline;
  final double totalPayCash;
  final String date;

  SureOrderTicketView(
      {Key key,
      @required this.airSeat,
      @required this.totalPayCash,
      @required this.airline,
      @required this.date})
      : super(key: key);

  _SureOrderTicketViewSate createState() => _SureOrderTicketViewSate();
}

///

class _SureOrderTicketViewSate extends State<SureOrderTicketView> {
  PersonInfoProvider _infoProvider = new PersonInfoProvider();
  TicketTrade ticketTrade;///购买飞机票
  TicketInfoProvider ticketInfoProvider;//数据库操作
  bool _isOnPress; ///是否按了提交按钮

  @override
  void initState() {
    select_item = [];
    ticketInfoProvider=new TicketInfoProvider();
    _isOnPress=false;
  }

  ///
  ///添加失败对话框
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
          "确认订单",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: ListView.builder(
          itemCount: (select_item.length + 3),
          itemBuilder: (BuildContext ctx, int index) {
            if (index == 0) {
              return Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Colors.grey.shade300,
                      //height: 150,
                      padding: EdgeInsets.all(8.0),
                      margin: EdgeInsets.only(
                          left: 5.0, right: 5.0, top: 5.0, bottom: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              SizedBox(
                                width: 5.0,
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "${widget.airline.flightNo}",
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.black),
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
                                    Text(widget.airline.orgCityName),
                                    Text(widget.airline.depTime),
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
                                    Text(widget.airline.dstCityName),
                                    Text(widget.airline.arriTime),
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

                          Container(
                            height: 100.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Row(
                                        children: <Widget>[
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Text(
                                            "舱位: ",
                                            style: TextStyle(
                                                color: Colors.black87),
                                          ),
                                          Text(
                                            "${widget.airSeat.seatCode}",
                                            style: TextStyle(
                                                fontSize: 25.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            " ${widget.airSeat.seatMsg}",
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Wrap(
                                        children: <Widget>[
                                          Text("可用坐席："),
                                          Text(
                                            "${widget.airSeat.seatStatus == 'A' ? '有' : widget.airSeat.seatStatus}",
                                            style:
                                                TextStyle(color: Colors.green),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Expanded(
                                      //成人价
                                      flex: 4,
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            "实际支付金额",
                                          ),
                                          Text(
                                            "￥${widget.totalPayCash.toString().length < 11 ? widget.totalPayCash : widget.totalPayCash.roundToDouble()}",
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 20.0,
                                            ),
                                            overflow: TextOverflow.clip,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child:
                                          Text("折扣 ${widget.airSeat.discount}"),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }

            ///
            /// 倒数第二行，添加乘客
            if (index == (select_item.length + 1)) {
              return Container(
                height: 40.0,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Icon(Icons.add,color: Colors.orange,),
                    //Text('选择乘客',style: TextStyle(color: Colors.orange),),
                    FlatButton(
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.add,
                            color: Colors.orange,
                            size: 30.0,
                          ),
                          Text(
                            '选择乘客',
                            style:
                                TextStyle(color: Colors.orange, fontSize: 20.0),
                          ),
                        ],
                      ),
                      onPressed: () async{
                        ///打开选择页面
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext ctx) {
                          return OrderItem();
                        })).then((onValue) {
                          print("////$onValue");
                          if (onValue.length > 0) {
                            ///查找选择的乘客信息
                            List<int> _ids = onValue;
                            ///要查的id
                            List<PersonInfo> personinfs = [];
                            _ids.forEach((item) async{
                              await _infoProvider.getPersonInfo(item).then((onValue) {
                                //print("////$onValue");
                                personinfs.add(onValue);
                                setState(() {
                                  select_item = personinfs;
                                });
                              });
                            });

                          }
                        }).catchError((onError) {});
                      },
                    ),
                  ],
                ),
              );
            }
            submit() async{
              debugPrint("提交订单");
              setState(() {///点击了提交按钮
                _isOnPress=true;
              });
              Scaffold.of(ctx).showSnackBar( SnackBar(content: Text('购票中...请勿重复操作'),duration: Duration(seconds: 30),));
              //showModalBottomSheet(context: ctx, builder: (BuildContext context)=>SnackBar(content: Text('购票中...请勿重复操作'),duration: Duration(seconds: 15),));
              if(select_item.length>5||select_item.length<1){///乘客信息不能超过5个
                _openAlertDialog('失败! 请添加乘客信息0-5位内');
              }else{
                await  _payAirBill(seatCode: widget.airSeat.seatCode,itemId: banmaApi.itemId,
                    contactName: banmaApi.username,contactTel: banmaApi.userPhone,date: widget.date,from: widget.airline.orgCity,
                    to: widget.airline.dstCity,flightNo: widget.airline.flightNo,companyCode: widget.airSeat.airlineCode);
              }
              ///移出提示信息
              Scaffold.of(ctx).removeCurrentSnackBar();
              ///恢复按钮
              setState(() {
                _isOnPress=false;
              });
            }
            ///提交订单按钮
            if (index == (select_item.length + 2)) {
              return Container(
                height: 65.0,
                color: Colors.grey.shade300,
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        onPressed: _isOnPress==false?submit:null,
                        color: Colors.blue,
                        disabledColor: Colors.grey.shade400,
                        child: Text(
                          '提交订单',
                          style: TextStyle(color: Colors.white),
                        ),
                        splashColor: Colors.green,
                      ),
                    ),
                  ],
                ),
              );
            }
            return Container(
              height: 65.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          height: 10.0,
                          color: Color(AppColors.DividerColor),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Container(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            select_item[index - 1].username,
                            style: AppStyle.PersonItemTextStyle,
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Text(
                            select_item[index - 1].type,
                            style: AppStyle.PersonItemTextStyle,
                          )),
                      Expanded(
                          flex: 5,
                          child: Text(
                            select_item[index - 1].identifyId,
                            style: AppStyle.PersonItemTextStyle,
                          )),
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          //删除按钮
                          icon: Icon(
                            Icons.delete,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              select_item.removeAt(index-1);
                            });
                          },
                        ),
                      ),
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
            );
          }),
    );
  }




  ///支付处理
  _payAirBill( {@required seatCode,
    @required itemId,
    @required contactName,
    @required contactTel,
    @required date,
    @required from,
    @required to,
    @required companyCode,
    @required flightNo}) async{

    String passagers="";
    select_item.forEach((item) {
      passagers+= item.username+","+item.telphone.toString()+","+item.identifyId+";";
    });

   /* print("seatCode: $seatCode,passagers: $passagers,"
        "itemId: $itemId,contactName: $contactName,contactTel: $contactTel,date: $date,from: $from,"
        "to: $to,flightNo: $flightNo,companyCode: $companyCode");
*/

   var result= await PaypayBill(seatCode: seatCode,passagers: passagers,itemId: itemId,
        contactName: contactName,contactTel: contactTel,date: date,from: from,
        to: to,flightNo: flightNo,companyCode: companyCode).then((onValue){
          print(onValue);
       setState(() {
         ticketTrade=onValue;
         print("插入数据库ticketTrade:  ${ticketTrade}");
         ///插入数据库
         TicketInfo ticketInfo=new TicketInfo(tradeNo: ticketTrade.tradeNo,billState: ticketTrade.billState,ctime: ticketTrade.ctime);
         ticketInfoProvider.insert(ticketInfo);

         if(ticketTrade.billState==0){///没有支付成功
           ///取代当前页面
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext ctx){
             return NextOrderDetailView(ticketTrade: ticketTrade,);
           }));

         }else if(ticketTrade.billState==1){///支付成功
           //print("支付成功:  ${ticketTrade}");
           Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext ctx){
             return ListViewTicketOrders(ticketTrade: ticketTrade,);
           }));
         }
       });
    }).catchError((onError){
     try{
       print("onError: $onError");
       ticketTrade=onError;
       //print("*******:  ${ticketTrade}");

     }catch(e){
       print("eee*:  ${e}");
       ResponseException responseException=onError;
       _openAlertDialog(responseException.subErrors[0].message);
     }

    });


  }



}








//供应商工作时间
/* Row(
                      children: <Widget>[
                        SizedBox(
                          width: 5.0,
                        ),
                        Expanded(
                          child: Text("供应商工作时间: ${widget.airSeat.workTime}"),
                        ),
                        Expanded(
                          child: Text("废票时间: ${widget.airSeat.vtWorkTime}"),
                        ),
                      ],
                    ),*/
