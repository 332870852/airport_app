import 'package:airport_app/utils/wxPay.dart';
import 'package:flutter/material.dart';
import 'model/Item.dart';
import 'utils/http_util.dart';
import 'model/Response_exception.dart';
import 'model/Station.dart';
import 'main_animate.dart';
import 'package:airport_app/view/indexView/index_view.dart';
import 'package:airport_app/view/myinfoView/myPerson_view.dart';
import 'service/orderdetail_Dao.dart';
import 'package:airport_app/view/orderlistview/order_detail.dart';

void main() => runApp(AnimApp());

class AnimApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      theme: ThemeData(
        primarySwatch: Colors.grey,
        highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
        splashColor: Colors.white70,
        accentColor: Color.fromRGBO(3, 54, 255, 0.5),
      ),
    );
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      initialRoute: '/ ',
      routes: {
        //'/': (context) => Home(),
        '/about': (context) => AlertDialogDemo(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
        splashColor: Colors.white70,
        accentColor: Color.fromRGBO(3, 54, 255, 0.5),
      ),
    );
  }
}

class Home extends StatefulWidget {
  _HomeStae createState() => _HomeStae();
}

final _WidgetOptions = [
  IndexView(),
  OrderDetailView(),
  MyPersonIndexView(),

];

class _HomeStae extends State<Home> {
  int _currentIndex;

  @override
  void initState() {
    _currentIndex = 0;
  }

  void _onTapHandler(int index) {
    setState(//激活状态
        () {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: Builder(
          builder: (context) => _WidgetOptions.elementAt(_currentIndex),
        ),

        /* 添加底部导航栏*/
        //bottomNavigationBar: BottomNavigationBar_Air(),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(color: Colors.blue),
          child: BottomNavigationBar(
              fixedColor: Colors.green,
              //激活状态的颜色
              currentIndex: _currentIndex,
              //当前激活的按钮索引值
              type: BottomNavigationBarType.fixed,
              //如果底部导航栏超过四个图标，必须添加该类型
              onTap: _onTapHandler,
              //回调
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.flight),
                  title: Text('首页'),
                  activeIcon: Icon(Icons.flight_takeoff),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.assignment),
                  title: Text('订单'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  title: Text('我的'),
                ),
//                BottomNavigationBarItem(
//                  icon: Icon(Icons.list),
//                  title: Text('List'),
//                ),
              ]),
        ),
      ),
    );
  }
}

class AlertDialogDemo extends StatefulWidget {
  _AlertDialogDemoState createState() => _AlertDialogDemoState();
}

class _AlertDialogDemoState extends State<AlertDialogDemo> {
  String _choice = 'Noting';

  _getIPAddress() async {
    String chose;
    Map<String, String> map = new Map();
    map.putIfAbsent('itemId', () => '123456');
    var ResponseData =
        get(method: 'qianmi.elife.air.item.detail', requestmap: map);
    try {
      await ResponseData.then((onValue) {
        final ResponseBody = onValue.data['air_item_detail_response']['item'];
        Item item = Item.fromJson(ResponseBody);
        chose = item.toString();
        setState(() {
          _choice = chose;
        });
      }).asStream().toList();
    } catch (e) {
      print("exces: $e");
      setState(() {
        ResponseData.then((onValue) {
          final ResponseBody = onValue.data;
          ResponseException responseException =
              ResponseException.fromJson(ResponseBody);
          _choice = responseException.toString();
        });
      });
    }
  }

  void gggt() async{
    await fetchOrderdetail(tradeNo: 'T190212002933146');
  }

  _getTest() async {
    String chose;
    var ResponseData = get(method: 'qianmi.elife.air.stations.list');
    List<Station> stations;
    try {
      await ResponseData.then((onValue) {
        final ResponseBody =
            onValue.data['air_stations_list_response']['stations']['station'];
        //print(ResponseBody);
        stations = ResponseBody.map<Station>((item) => Station.fromJson(item))
            .toList();
        chose = stations.toString();
        setState(() {
          _choice = chose;
        });
      });
    } catch (e) {
      await ResponseData.then((onValue) {
        final ResponseBody = onValue.data;
        ResponseException responseException =
            ResponseException.fromJson(ResponseBody);
        chose = responseException.toString();
      });
      //print("********:$chose");
      setState(() {
        _choice = chose;
      });
    }
  }

  Future _openAlertDialog() async {
    final action = await showDialog(
        barrierDismissible: false, //必须选择一个才能关闭
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('AlertDialog'),
            content: Text('11111'),
            actions: <Widget>[
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('AlertDialogDemo'),
        elevation: 0.0,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Your choice is: $_choice'),
            SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('Open AlertDialog'),
                  onPressed: gggt, //_getIPAddress,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
