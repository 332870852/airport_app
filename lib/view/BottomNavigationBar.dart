import 'package:flutter/material.dart';


class BottomNavigationBar_Air extends StatefulWidget {
  Key key;
  BuildContext context;

  BottomNavigationBar_Air({this.context});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BottomNavigationBarState();

  }
}

class _BottomNavigationBarState extends State<BottomNavigationBar_Air> {
  int _currentIndex = 0;

  void _onTapHandler(int index) {
    setState(//激活状态
        () {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomNavigationBar(
        fixedColor: Colors.black,
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
            icon: Icon(Icons.list),
            title: Text('List'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('My'),
          ),
        ]);
  }
}
