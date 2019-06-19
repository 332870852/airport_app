import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:airport_app/utils/http_util.dart';
import 'package:airport_app/model/Airline.dart';
import 'package:airport_app/model/Station.dart';
import 'package:airport_app/service/airline_Dao.dart' show fetchAirlines;
import 'package:airport_app/utils/constants.dart' show Constants, AppColors, AppStyle;
import 'package:airport_app/view/indexView/orderticket_view.dart';

class AirlineView extends StatefulWidget {
  final Station FromStation, ToStation;
  final String date, itemId;

  /* 构造函数*/
  AirlineView(
      {Key key, this.FromStation, this.ToStation, this.date, this.itemId})
      : super(key: key);

  _AirlineViewState createState() => _AirlineViewState();
}

class _AirlineViewState extends State<AirlineView> {
  List<Airline> airlines;

  @override
  void initState() {
    super.initState();
    fetchAirlines(
            from: widget.FromStation.code,
            to: widget.ToStation.code,
            date: widget.date,
            itemId: widget.itemId)
        .then((onValue) {
      setState(() {
        airlines = onValue;
      });
    });
  }

  Future<List<Airline>> _fetchAirline(bool f) async {
    if (airlines == null || f == true) {
      return fetchAirlines(
          from: widget.FromStation.code,
          to: widget.ToStation.code,
          date: widget.date,
          itemId: widget.itemId);
    }
    return airlines;
  }

  _buildPopupMenuItem(int iconName, String title) {
    return Row(
      children: <Widget>[
        Icon(
          IconData(iconName, fontFamily: Constants.IconFontFamily),
          color: Colors.blue,
        ),
        Container(
          width: 12.0,
        ),
        Text(title)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.FromStation.name}<>${widget.ToStation.name}',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              debugPrint("_AirlineViewState返回");
              Navigator.pop(context);
            }),
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<String>>[
                PopupMenuItem(
                  child: _buildPopupMenuItem(0xe651, "刷新"),
                  value: "fresh",
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem(0xe64d, "保存到本地"),
                  value: "save_location",
                ),
              ];
            },
            onSelected: (String selected) {
              switch (selected) {
                case 'fresh':
                  {
                    fetchAirlines(
                            from: widget.FromStation.code,
                            to: widget.ToStation.code,
                            date: widget.date,
                            itemId: widget.itemId)
                        .then((onValue) {
                      setState(() {
                        //刷新
                        airlines = onValue;
                      });
                    }).catchError((onError) {
                      debugPrint("刷新失败:${onError}");
                    });
                  }
                  break;
              }
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: _fetchAirline(false),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          //debugPrint('data: ${snapshot.data}');
          debugPrint('connectionState: ${snapshot.connectionState}');
          debugPrint('error: ${snapshot.error}');
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(backgroundColor: Colors.blue,),//Text('loading...',style: TextStyle(fontSize: 25.0),),
            );
          }
          if (snapshot.data == null) {
            if (snapshot.error != null) {
              if(isChongshi){ //刷新后失败
                isChongshi=false;
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.warning,color: Colors.yellow, size: 50.0,),
                      Text('重试失败，请稍后再尝试!',style: TextStyle(fontSize: 25.0),),
                    ],
                  ),
                );
              }
              //
              return Container(
                margin: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //Center(child: ,),
                    Text('发生异常${snapshot.error}',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.center),
                    Icon(
                      Icons.flight,
                      size: 150,
                      color: Colors.grey,
                    ),
                    FlatButton(
                      key: Key("flatButton"),
                      child: Text(
                        '点击重试',
                        style: TextStyle(color: Colors.white),
                      ),
                      textColor: Colors.white,
                      color: Colors.blue,
                      onPressed: () {
                        debugPrint("刷新");
                         fetchAirlines(
                                from: widget.FromStation.code,
                                to: widget.ToStation.code,
                                date: widget.date,
                                itemId: widget.itemId)
                            .then((onValue) {
                          setState(() {
                            //刷新
                            airlines = onValue;
                          });
                        }).catchError((onError) {
                          debugPrint("刷新失败:${onError}");
                          setState(() {
                            isChongshi=true;
                          });

                        });
                      },
                    ),
                  ],
                ),
              );
            } else {
              return Container(
                margin: EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      '  很抱歉，按您的查询条件，当前未找到从${widget.FromStation.name}到${widget.ToStation.name}的航线。您可以更换站点或查询日期...',
                      textAlign: TextAlign.justify,
                    ),
                    //Text(widget.FromStation.name,style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(
                      height: 30,
                    ),
                    Icon(
                      Icons.flight_land,
                      size: 150.0,
                    ),
                    FlatButton(
                      child: Text(
                        '换乘航线',
                        style: TextStyle(color: Colors.white),
                      ),
                      textColor: Colors.white,
                      color: Colors.blue,
                      onPressed: () {
                        debugPrint('按了换乘路线');
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              );
            }
          }

          return ListView(
            children: snapshot.data.map<Widget>((item) {
              Airline _airline=item;
              return GestureDetector(
                onTap: () {
                 // print("点击了${item.orgCityName}");
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                    return OrderTicketView(airline: _airline,date:widget.date);//打开提交订单页面
                  }));
                },
                child: Container(

                  height: 100,
                  margin: EdgeInsets.only(left: 5.0,right: 5.0,top: 10.0),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.0),color: Colors.grey.shade300,),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SizedBox(width: 5.0,),
                          Expanded(
                            flex: 1,
                            child: Text(
                              "${item.flightNo}",
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
                                Text(item.orgCityName),
                                Text(item.depTime),
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
                                Text(item.dstCityName),
                                Text(item.arriTime),
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
                        ))),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(width: 5.0,),
                          Text("舱位:"),
                          Text("${_airline.airSeats.airSeat.length}",style: TextStyle(color: Colors.green),),
                          Padding(child: Text("未打折的价格: ￥${_airline.basePrice}",style: TextStyle(color: Colors.red),),
                            padding: EdgeInsets.only(left: 50.0),),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          );


        },
      ),
    );
  }
}

bool isChongshi=false;
