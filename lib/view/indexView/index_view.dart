import 'package:airport_app/dao/airItem_detail_dao.dart';
import 'package:flutter/material.dart';
import 'package:airport_app/utils/constants.dart';
import 'package:airport_app/view/indexView/listview_station.dart';
import 'package:airport_app/model/Station.dart';
import 'package:airport_app/utils/constants.dart'
    show week_map, Constants, AppColors, AppStyle, banmaApi;
import 'package:airport_app/view/indexView/Airline_view.dart';



class IndexView extends StatefulWidget {
  _IndexViewState createState() => _IndexViewState();
}

//当前出发时间
DateTime _nowTime = DateTime.now().add(Duration(days: 1));
String _time = _nowTime.toString().substring(0, 10);
String _weekDay= week_map[_nowTime.weekday];

Station start_station = new Station('PEK', '', '', ''),
    end_station = new Station('CAN', '', '', '');
class _IndexViewState extends State<IndexView> {


  @override
  void initState() {
    super.initState();
    if (start_station.name.isEmpty)
      setState(() {
        start_station.name = '北京';
      });
    if (end_station.name.isEmpty)
      setState(() {
        end_station.name = '广州';
      });

    //初始化时间
    /*_nowTime= DateTime.now().add(Duration(days: 1));
    _time= _nowTime.toString().substring(0, 10);
    _weekDay=week_map[_nowTime.weekday];*/
    /*需要IO操作*/
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 250.0,
                    width: double.infinity,
                    //color: Colors.yellow,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/body.jpg'),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.yellow[400].withOpacity(0.6),
                              BlendMode.hardLight)),
                    ),
                  ),
                  /*   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        color: Colors.green,
                      ),
                    ],
                  ),*/
                  Padding(
                    padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 200),
                    child: Material(
                      elevation: 1.0,
                      borderRadius: BorderRadius.circular(5.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 270,
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                              ),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                width: Constants.DividerWith,
                                color: Color(AppColors.DividerColor),
                              ))),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  //RaisedButton(textTheme: ButtonTextTheme.accent,child: Text('shanghai'),),
                                  Expanded(
                                    flex: 3,
                                    child: FlatButton(
                                      child: Wrap(
                                        direction: Axis.horizontal,
                                        textDirection: TextDirection.ltr,
                                        children: <Widget>[
                                          Text(
                                            start_station.name,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                            ),
                                            overflow: TextOverflow.clip,
                                          )
                                        ],
                                      ),
                                      onPressed: () {
                                        //选择车站
                                        //print("选择了${start_station}");
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
                                                    child:  ListViewStation(title: '选择车站'),
                                                  );
                                         // return ListViewStation(title: '选择车站');
                                        })).then((onValue) {
                                          if (onValue != null) {
                                            setState(() {
                                              start_station = onValue;
                                              print("onValue:${start_station}");
                                            });
                                          }
                                        });

                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: Icon(
                                      IconData(
                                        0xe600,
                                        fontFamily: Constants.IconFontFamily,
                                      ),
                                      size: 40,
                                      color: Colors.green,
                                    ),
                                    flex: 1,
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: FlatButton(
                                      child: Text(
                                        end_station.name,
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 20),
                                        overflow: TextOverflow.clip,
                                      ),
                                      onPressed: () {
                                        //选择终点站
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
                                                child:  ListViewStation(title: '选择车站'),
                                              );

                                        })).then((onValue) {
                                          if (onValue != null)
                                            end_station = onValue;
                                          print("onValue:${end_station}");
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                              ),
                              padding: const EdgeInsets.only(
                                  left: 16.0,
                                  right: 16.0,
                                  top: 0.0,
                                  bottom: 20.0),
                              decoration: BoxDecoration(
                                  //color: Colors.green,
                                  border: Border(
                                      bottom: BorderSide(
                                width: Constants.DividerWith,
                                color: Color(AppColors.DividerColor),
                              ))),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Text('出发日期'),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: FlatButton(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            _time,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20.0,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Text(
                                            _weekDay,
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                      onPressed: () {
                                        print('选择日期');
                                        //_showDataPicker(context);
                                        showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now()
                                              .subtract(new Duration(days: 15)),
                                          lastDate: DateTime.now()
                                              .add(new Duration(days: 30)),
                                          //locale: Locale('ch','zh'),
                                        ).then((DateTime onValue) {
                                          print(onValue
                                              .toIso8601String()
                                              .substring(0, 10));
                                          setState(() {
                                            _time = onValue //日期
                                                .toIso8601String()
                                                .substring(0, 10);
                                            //星期
                                            _weekDay =
                                                week_map[onValue.weekday];
                                          });
                                        }).catchError((onError) {
                                          print(onError);
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                              ),
                              //padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 10.0, bottom: 10.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Expanded(
                                        child: RaisedButton(
                                          child: Text(
                                            '查询车票',
                                            style: TextStyle(
                                                color: Colors.white,
                                                letterSpacing: 1.0,
                                                fontSize: 15.0),
                                          ),
                                          color: Colors.blue,
                                          onPressed: () {
                                            print("查询车票");
                                            Navigator.push(context,
                                                MaterialPageRoute(builder:
                                                    (BuildContext context) {
                                              return AirlineView(
                                                FromStation: start_station,
                                                ToStation: end_station,
                                                date: _time,
                                                itemId: banmaApi.itemId,
                                              );
                                            }));
                                          },
                                          splashColor: Colors.blue[100],
                                          highlightColor: Colors.green,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
