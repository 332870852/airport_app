import 'package:flutter/material.dart';
import 'package:airport_app/model/TicketTrade.dart';
import 'package:airport_app/utils/constants.dart';
import 'listview_ticketOrders.dart';

class OrderItemList extends StatefulWidget{

  final List<TicketTrade> ticketTrades;
  final String title;
  OrderItemList({Key key,@required this.ticketTrades,@required this.title}):super(key:key);

  _OrderItemListState createState()=>new _OrderItemListState();

}

class _OrderItemListState extends State<OrderItemList>{

  final List<_OrderItem> _items = [];

  @override
  void initState() {
    ///初始化_items
    widget.ticketTrades.forEach((item){
      _items.add(_OrderItem(title: item.title,startTime: item.startTime,trainNo: item.trainNo,count: item.ticketOrders.ticketOrder.length,
      ConstractName: item.contactName,telphone: item.contactTel,tradeNo: item.tradeNo,));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          ListView.builder(
              itemCount: _items.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return Container(
                    height: 25.0,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Color(AppColors.DividerColor),
                                width: Constants.DividerWith)),
                        color: Colors.grey.shade200),
                  );
                }
                return GestureDetector(
                  child: _items[index - 1],
                  onTap: () {
                    debugPrint("点击了${_items[index - 1].title}");
                    ///新页面显示详细
                    Navigator.push(context,
                        PageRouteBuilder(pageBuilder:
                            (BuildContext context, Animation animation,
                            Animation secondaryAnimation) {
                          return SlideTransition(
                            position: Tween<Offset>(
                                begin: Offset(-1.0, 0.0),
                                end:Offset(0.0, 0.0)
                            )
                                .animate(CurvedAnimation(
                                parent: animation,
                                curve: Curves.fastOutSlowIn
                            )),
                            child: ListViewTicketOrders(ticketTrade: widget.ticketTrades[index-1],),
                          );
                          // return ListViewStation(title: '选择车站');
                        }));
                  },
                );
              }),
        ],
      ),
    );
  }

}


class _OrderItem extends StatelessWidget {
  final String title;
  final String startTime; ///出发时间
  final String trainNo; ///班次
  final String tradeNo;///订单号
  final String ConstractName;///联系人
  final String telphone; ///联系人电话
  final int count;  //车票张数

  _OrderItem({Key key, @required this.title, @required this.startTime,@required this.trainNo,@required this.count,
  @required this.ConstractName, @required this.tradeNo, @required this.telphone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //列表项主体部分
    Widget _button = Container(
      /*margin: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),*/
      height: 100.0,
        margin: EdgeInsets.only(left: 5.0,right: 5.0,top: 10.0),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),color: Colors.grey.shade200,),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                flex: 8,
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
                      trainNo,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),

              Expanded(
                  flex: 3,
                  child:  Row(
                    children: <Widget>[
                      Text('查看详细',style: TextStyle(color: Colors.green),),
                      Icon(Icons.arrow_forward_ios,color: Colors.grey.shade400,)
                    ],
                  )
              ),

            ],
          ),
      Container(
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: Constants.DividerWith,
                  color: Color(AppColors.DividerColor))),
        ),
      ),
          SizedBox(width: 10.0,),
          ///显示主体
          Container(
            //height: 50,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(2.0),color: Colors.grey.shade300,),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('订单号:  ${tradeNo}'),
                  ],
                ),
                SizedBox(height: 5.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('起飞时间:  ${startTime}开'),
                  ],
                ),
                SizedBox(height: 5.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('总张数:  ${ConstractName}  ${count}张'),
                  ],
                ),
                SizedBox(height: 5.0,),

              ],
            ),
          )
        ],
      )
    );

    return _button;
  }
}