import 'package:flutter/material.dart';
import 'package:airport_app/service/orderdetail_Dao.dart';
import 'package:airport_app/model/Response_exception.dart';
import 'package:airport_app/model/TicketTrade.dart';
import 'package:airport_app/utils/constants.dart';
import 'package:airport_app/model/TicketOrder.dart';
import 'package:airport_app/service/refund_Dao.dart';

class ListViewTicketOrders extends StatefulWidget {
  TicketTrade ticketTrade;

  ListViewTicketOrders({Key key, @required this.ticketTrade}) : super(key: key);

  _ListViewTicketOrdersState createState() => new _ListViewTicketOrdersState();
}

//List<TicketTrade> _ticketTrade = [];
//Map<int, String> seatType = new Map();

class _ListViewTicketOrdersState extends State<ListViewTicketOrders> {
  final _bottomSheetScaffoldKey = GlobalKey<ScaffoldState>();

  TicketTrade TKtrade;

  @override
  void initState() {
    TKtrade = widget.ticketTrade;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _bottomSheetScaffoldKey,
        appBar: AppBar(
          title: Text(
            '已支付',
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            Container(
              child: Container(
                color: Colors.grey.shade300,
                //height: 280,
                margin: EdgeInsets.only(
                    left: 5.0, right: 5.0, top: 0.0, bottom: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      height: 40.0,
                      color: Colors.white,
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.flight_takeoff,
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            TKtrade.trainNo,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(TKtrade.title,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(
                            width: 35.0,
                          ),
                          Text('￥${TKtrade.totalPayCash.toString()}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red)),
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
                            "${TKtrade.trainNo}",
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.black),
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
                              Text(TKtrade.startStation),
                              Text(TKtrade.startTime),
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
                              Text(TKtrade.recevieStation),
                              Text(TKtrade.recevieTime),
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
                          "${TKtrade.tradeNo}",
                          style: TextStyle(color: Colors.green),
                        ),
                        SizedBox(
                          width: 50.0,
                        ),
                        Text(
                          "${TKtrade.billState == 0 ? '未支付' : '已支付'}",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 5.0,
                    ),
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
                              "${TKtrade.contactName}",
                              style: TextStyle(color: Colors.black),
                            ),
                            SizedBox(
                              width: 50.0,
                            ),
                            Text(
                              "${TKtrade.contactTel}",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: 5.0,
                            ),
                            Text("发车时间:"),
                            Text(
                              "${TKtrade.startTime}",
                              style: TextStyle(color: Colors.green),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            //Text("${widget.ticketTrade.totalRefundAmount}"),
                          ],
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: 5.0,
                            ),
                            Text("订单创建时间:"),
                            Text(
                              "${TKtrade.ctime}",
                              style: TextStyle(color: Colors.black),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              "${TKtrade.stateName}",
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10.0),
                      alignment: Alignment.centerLeft,
                      height: 35.0,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text("|", style: TextStyle(color: Colors.grey)),
                          SizedBox(
                            width: 20,
                          ),
                          FlatButton(
                            child: Text(
                              "改签",
                              style: TextStyle(color: Colors.grey),
                            ),
                            splashColor: Colors.blue,
                            onPressed: () {
                              debugPrint("暂无改签功能");
                            },
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text("|", style: TextStyle(color: Colors.grey)),
                          SizedBox(
                            width: 25,
                          ),
                          FlatButton(
                            child: Text(
                              "退票",
                              style: TextStyle(color: Colors.black),
                            ),
                            splashColor: Colors.blue,
                            onPressed: () {
                              debugPrint("点击了退票");
                              bool isTure = false;
                              TKtrade.ticketOrders.ticketOrder.forEach((item) {
                                item.state == 11 ? isTure = true : false;
                              });
                              if (!isTure) {
                                ///是否含有没有退的票
                                _openSimpleDialog(TKtrade);
                              } else {
                                return null;
                              }
                              //fetchAirOrderRefund(tradeNo: TKtrade.tradeNo,returnType: '3',orderNos: TKtrade.ticketOrders.ticketOrder[0].orderNo);
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),

                    GestureDetector(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text(
                                  TKtrade.ticketOrders.ticketOrder[0].seatInfo),
                              Text(
                                TKtrade.ticketOrders.ticketOrder[0].stateName,
                                style: TextStyle(color: Colors.red),
                              ),
                              Text(
                                '点击查看详情',
                                style: TextStyle(color: Colors.green),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          _openModalBottomSheet(
                              TKtrade.ticketOrders.ticketOrder);
                        }),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  ///
  Future _openModalBottomSheet(List<TicketOrder> ticketOrders) async {
    int count = ticketOrders.length;
    final option = await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 75 * count.toDouble(),
            child: ListView.builder(
                itemCount: ticketOrders.length,
                itemBuilder: (BuildContext ctx, int index) {
                  return Column(
                    children: <Widget>[
                      Text(ticketOrders[index].seatInfo),
                      Text(
                        "联系人号码  ${ticketOrders[index].passengerTel}",
                        style: TextStyle(color: Colors.green),
                      ),
                      Text(
                        ticketOrders[index].stateName,
                        style: TextStyle(color: Colors.red),
                      ),
                      Text(
                        "证件号  ${ticketOrders[index].idcardNo}",
                        style: TextStyle(color: Colors.green),
                      ),
                      Text(
                        "商品订单子单号  ${ticketOrders[index].orderNo}",
                        style: TextStyle(color: Colors.green),
                      ),
                      //分割线
                      Container(
                        padding: EdgeInsets.only(top: 5.0),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                          width: Constants.DividerWith,
                          color: Color(AppColors.DividerColor),
                        ))),
                      ),
                    ],
                  );
                }),
          );
        });
  }

  ///选择对话框
  Future _openSimpleDialog(TicketTrade ticketTde) async {
    List<TicketOrder> ticketOrders = ticketTde.ticketOrders.ticketOrder;

    ///添加退票选项
    List<SimpleDialogOption> sitems = [];
    List<SimpleDialogOption> Itemss(BuildContext ctx) {
      for (int i = 0; i < ticketOrders.length; i++) {
        SimpleDialogOption sitem = SimpleDialogOption(
          child: Container(
            child: Text(ticketOrders[i].seatInfo),
            color: Colors.green.shade400,
          ),
          onPressed: () {
            Navigator.pop(ctx, ticketOrders[i].orderNo);
          },
        );
        sitems.add(sitem);
      }

      SimpleDialogOption sitem = SimpleDialogOption(
        child: Center(
          child: Text(
            '取消',
            style: TextStyle(color: Colors.red, fontSize: 20.0),
          ),
        ),
        onPressed: () {
          Navigator.pop(ctx, null);
        },
      );
      sitems.add(sitem);
      return sitems;
    }

    final option = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text('温馨提示:选择您要退的机票,立即生效'),
            children: Itemss(context),
          );
        });

    if (option != null) {
      ///退票
      fetchAirOrderRefund(
              tradeNo: ticketTde.tradeNo, returnType: '3', orderNos: option)
          .then((onValue) {
        if (onValue == "1") {
          ///成功
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return SimpleDialog(
                  title: Text('退票成功'),
                );
              });
        } else {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return SimpleDialog(
                  title: Text('退票失败'),
                );
              });
        }
      }).catchError((onError) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return SimpleDialog(
                title: Text('温馨提示'),
                children: <Widget>[
                  Wrap(
                    children: <Widget>[
                      Text(onError.toString()),
                    ],
                  ),
                ],
              );
            });
      });
    }
  }
}
