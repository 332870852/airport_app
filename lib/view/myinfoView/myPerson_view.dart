import 'package:flutter/material.dart';
import 'package:airport_app/utils/constants.dart' show AppColors, AppStyle, Constants, banmaApi;
import 'package:airport_app/view/myinfoView/myPerson_contacts.dart';
import 'package:airport_app/dao/airItem_detail_dao.dart';

class _PersonItem extends StatelessWidget {
  final String title;
  final String groupTitle;

  _PersonItem({Key key, @required this.title, this.groupTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //列表项主体部分
    Widget _button = Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      height: 50.0,
      //让下划线不占满整个控件
      //padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 10.0, bottom: 10.0),
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      //padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
                width: Constants.DividerWith,
                color: Color(AppColors.DividerColor))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            flex: 8,
            child: Text(title),
          ),
          Expanded(
            flex: 1,
            child:  Icon(Icons.arrow_forward_ios,color: Colors.grey.shade400,)
          ),

        ],
      ),
    );

    return _button;
  }
}

class MyPersonIndexView extends StatefulWidget {
  _MyPersonIndexViewState createState() => _MyPersonIndexViewState();
}

class _MyPersonIndexViewState extends State<MyPersonIndexView> {
  final List<_PersonItem> _items = [
    _PersonItem(title: banmaApi.username),
    _PersonItem(title: '常用联系人'),
    _PersonItem(title: '我的保险'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '我的个人中心',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0.0,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              IconData(0xe65e, fontFamily: Constants.IconFontFamily),
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
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
                    switch(index-1){
                      case 0:{
                        ////////////////////////测试
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext ctx)=>new TestView()));
                        break;
                      }
                      case 1: //常用联系人
                        {

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
                                  child: ContactsView(title: '${_items[index - 1].title}'),
                                );
                                // return ListViewStation(title: '选择车站');
                              }));
                        }
                        break;
                    }
                  },
                );
              }),
        ],
      ),
    );
  }
}
