import 'package:flutter/material.dart';
import 'package:airport_app/model/Airline.dart';
import 'package:airport_app/model/AirSeat.dart';
import 'package:airport_app/utils/constants.dart';
import 'package:airport_app/view/indexView/Sure_OrderTicketView.dart';

class OrderTicketView extends StatefulWidget {
  final Airline airline;
  final String date; //日期
  OrderTicketView({Key key, @required this.airline,@required this.date}) : super(key: key);

  _OrderTicketViewState createState() => _OrderTicketViewState();
}

class _OrderTicketViewState extends State<OrderTicketView> {
  List<AirSeat> _airSeats;

  @override
  void initState() {
    super.initState();
    _airSeats = widget.airline.airSeats.airSeat;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "选择舱位",
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
        itemBuilder: (BuildContext context, int index) {
          //第一项数据
          //AirSeat _currentAirseat= _airSeats[index-1];

          if (index == 0) {
            return Container(
              color: Colors.grey.shade300,
              height: 100,
              margin: EdgeInsets.only(left: 5.0, right: 5.0, top: 10.0,bottom: 10.0),
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

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 5.0,
                      ),
                      Text("舱位:"),
                      Text(
                        "${_airSeats.length}",
                        style: TextStyle(color: Colors.green),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text("${widget.airline.flightCompanyCode}"),
                    ],
                  ),
                ],
              ),
            );
          }
          return GestureDetector(
            child: Container(
              height: 120.0,
              margin: EdgeInsets.only(left: 5.0, right: 5.0, top: 16.0),
              decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Color(AppColors.DividerColor),width: Constants.DividerWith)),
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
                              style: TextStyle(color: Colors.black87),
                            ),
                            Text(
                              "${_airSeats[index - 1].seatCode}",
                              style: TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Text(
                              " ${_airSeats[index - 1].seatMsg}",
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
                              "${_airSeats[index - 1].seatStatus == 'A' ? '有' : _airSeats[index - 1].seatStatus}",
                              style: TextStyle(color: Colors.green),
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
                        child: Row(
                          children: <Widget>[
                            Text("成人价"),
                            Text(
                              "￥${_airSeats[index - 1].settlePrice}",
                              style: TextStyle(color: Colors.red, fontSize: 20.0),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Text("折扣 ${_airSeats[index - 1].discount}"),
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

                  //供应商工作时间
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 5.0,
                      ),
                      Expanded(
                        child: Text("供应商工作时间: ${_airSeats[index - 1].workTime}"),
                      ),
                      Expanded(
                        child: Text("废票时间: ${_airSeats[index - 1].vtWorkTime}"),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            onTap: (){
              debugPrint("按了${_airSeats[index - 1].seatCode}");
              Airline airline=widget.airline ;
              //airline.airSeats.airSeat.clear();
              //实际支付金额
              var totalPayCash=(_airSeats[index - 1].settlePrice)*0.99+airline.adultFuelTax+airline.adultAirportTax;
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext ctx){
                return  SureOrderTicketView(airSeat: _airSeats[index - 1], totalPayCash: totalPayCash,airline: airline,date: widget.date,);
              }));

            },
          );
        },
        itemCount: _airSeats.length + 1,
      ),
    );
  }
}
