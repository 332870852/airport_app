import 'package:flutter/material.dart';
import 'package:airport_app/model/TicketTrade.dart';
import 'package:airport_app/view/orderlistview/listview_ticketOrders.dart';
import 'order_ItemList.dart';
import 'package:airport_app/service/orderdetail_Dao.dart';
import 'package:airport_app/utils/constants.dart' show Constants;

class Finsh_OrderDetail extends StatefulWidget {
  final TicketTrade ticketTrade;

  Finsh_OrderDetail({Key key, @required this.ticketTrade}) : super(key: key);

  _Finsh_OrderDetailState createState() => new _Finsh_OrderDetailState();
}

class _Finsh_OrderDetailState extends State<Finsh_OrderDetail> {
  ///isHistory  true是查询历史订单,false是查询已支付订单
  Future<List<TicketTrade>> _fetchTicketTrade(
      {@required bool isHistory}) async {
    ///isHistory 是否是历史订单
    var data;
    var historyData;
    List<TicketTrade> _ticketTrade = [];

    ///已支付订单
    List<TicketTrade> histroy_ticketTrade = [];

    ///历史支付订单
    if (_ticketTrade.length == 0) {
      data =
          await fetchOrderdetail(tradeNo: 'T190304162949363').then((onValue) {
        _ticketTrade.add(onValue);
        if (!isHistory) {
          return _ticketTrade;
        } else {
          //onValue.startTime;
          print(onValue.startTime);
          bool isHistoryDate =
              DateTime.now().isAfter(DateTime.parse(onValue.startTime));///现在的日期是否比出发日期晚(过期时间)
          print("***${isHistoryDate}");
          if(isHistoryDate)///是历史
            {
              histroy_ticketTrade.add(onValue);
              historyData=histroy_ticketTrade;
              return histroy_ticketTrade;
            }
        }
      });
    }
    if (!isHistory) {
      return data;
    } else {
      return historyData;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ///构建历史订单和已支付订单页面的方法
    FutureBuilder ViewFutureBuilder(
        {@required bool IsHistory, String viewTitle, String warnInfo}) {
      return FutureBuilder(
          future: _fetchTicketTrade(isHistory: IsHistory),
          builder: (BuildContext ctx, AsyncSnapshot snapshot) {
            //print("****data ${snapshot.data}");
            //print("****error ${snapshot.error}");
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  strokeWidth: 1.0,
                ),
              );
            }
            if (snapshot.data == null) {
              if (snapshot.error != null) {
                ///显示异常页面
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.warning,
                        size: 50,
                      ),
                      Text(
                        '网络异常${snapshot.error}',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              }
              return Container(
                ///显示没有查到数据页面
                margin: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.info_outline,
                      size: 150,
                      color: Colors.blue,
                    ),
                    Text(warnInfo,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.center),
                  ],
                ),
              );
            }
            return OrderItemList(
              ticketTrades: snapshot.data,
              title: viewTitle,
            );
          });
    }

    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "已支付",
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
          actions: <Widget>[
            IconButton(
                icon: Icon(
                    IconData(0xe651, fontFamily: Constants.IconFontFamily)),
                onPressed: () {
                  ///刷新页面
                  setState(() {});
                })
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(color: Colors.grey), //美化当前的Container容器
          child: TabBar(
            unselectedLabelColor: Colors.white,
            indicatorColor: Colors.blue,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Colors.blue,
            indicatorWeight: 1.0,
            tabs: <Widget>[
              Tab(
                text: '已支付订单',
              ),
              Tab(
                text: '历史订单',
              ),
            ],
          ),
        ),
        body: TabBarView(children: <Widget>[
          ///构建已支付订单页面

          ViewFutureBuilder(
              IsHistory: false, warnInfo: '没有查到您的订单信息', viewTitle: '已支付'),

          ///历史订单页面
          ViewFutureBuilder(
              IsHistory: true, warnInfo: '没有查到您的历史订单信息', viewTitle: '已支付'),
        ]),
      ),
    );
  }
}
