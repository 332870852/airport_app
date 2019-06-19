import 'dart:io';
import 'package:flutter/material.dart';
import 'package:airport_app/model/Station.dart';
import 'package:airport_app/model/Response_exception.dart';
import './listview_station_search.dart';
import 'package:airport_app/service/station_Dao.dart' show stations,INDEX_BAR_WORDS,fetchStations;
import 'package:airport_app/utils/constants.dart'show AppStyle,AppColors,Constants;

//页面数据
class _StationItem extends StatelessWidget{

  _StationItem({@required this.name,this.groupTitle});
  final String name;
  final String groupTitle;


  @override
  Widget build(BuildContext context) {
    //列表项主体部分
    Widget _button = Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
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
        children: <Widget>[
          SizedBox(
            width: 10.0,
          ),
          Text(name),
        ],
      ),
    );


    //分组标签
    Widget _itemBody;
    if (this.groupTitle != null) {
      _itemBody = Column(
        children: <Widget>[
          Container(
            padding:
            EdgeInsets.only(left: 16.0, right: 16.0, top: 4.0, bottom: 4.0),
            color: Color(AppColors.StationGroupTitleBg),
            alignment: Alignment.centerLeft,
            child:
            Text(this.groupTitle, style: AppStyle.GroupTitleItemTextStyle),
          ),
          _button,
        ],
      );
    } else {
      _itemBody = _button;
    }
    return _itemBody;

  }

}


class ListViewStation extends StatelessWidget {
  final String title;

  ListViewStation({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              print('按了black');
              Navigator.pop(context);
            }),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: searchBarDelegate(station: stations)).then((onValue){
                      print(onValue);
                      if(onValue==null){
                        //station是否为空
                        fetchStations().then((onValue) {
                          //初始化station
                         // setState(() {
                            stations = onValue;
                            stations.sort((Station a,Station b)=>a.quanpin.substring(0,1).compareTo(b.quanpin.substring(0,1)));//排序
                         // });
                        });
                      }
                });
              }),
        ],
      ),
      body: HttpDemoHome(),
    );
  }
}

class HttpDemoHome extends StatefulWidget {
  @override
  _HttpDemoHomeState createState() => _HttpDemoHomeState();
}

class _HttpDemoHomeState extends State<HttpDemoHome> {
  @override
  void initState() {
    super.initState();
    if (stations == null) {
      //station是否为空
      fetchStations().then((onValue) {
        //初始化station
        setState(() {
          stations = onValue;
          stations.sort((Station a,Station b)=>a.quanpin.substring(0,1).compareTo(b.quanpin.substring(0,1)));//排序
        });
      });
    }
  }

  /*Future<List<Station>> fetchStations() async {
    var ResponseData = await get(method: 'qianmi.elife.air.stations.list');
    List<Station> stations;
    try {
      final responseBody = ResponseData.data['air_stations_list_response']
          ['stations']['station'];
      stations =
          responseBody.map<Station>((item) => Station.fromJson(item)).toList();
      //print('aa: $stations');
      return stations;
    } catch (e) {
      print('responseBody Exception: $e');
      ResponseException responseException =
          ResponseException.fromJson(ResponseData.data);
      throw '错误代码:(${responseException.code}),messager:${responseException.message},solution:${responseException.solution}';
    }
  }*/

  Future<List<Station>> _fetchStation() async {
    if (stations == null) {
      return fetchStations();
    } else
      return stations;
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _letters=INDEX_BAR_WORDS.map((String  word){
      return Expanded(
        child: Text(word),
      );
    }).toList();

    return FutureBuilder(
      future: _fetchStation(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        //print('data: ${snapshot.data}');
        print('connectionState: ${snapshot.connectionState}');
        print('error: ${snapshot.error}');
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(strokeWidth: 1.0,),
          );
        }
        if (snapshot.data == null) {
          if(snapshot.error != null){
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

        }

        return Stack(
          children: <Widget>[
            ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                
                Station _cureentStation=stations[index];//当前的station
                String nameIndex=_cureentStation.quanpin.substring(0,1);//排序索引
                bool isGroupTitle = true; //是否是分组第一条数据
                if (index >= 1 &&
                    nameIndex== stations[index-1].quanpin.substring(0,1)) {
                  isGroupTitle = false; //不需要分组
                }
                return GestureDetector(
                  child:  _StationItem(name: _cureentStation.name,groupTitle: isGroupTitle ? nameIndex : null,),
                  onTap: (){
                    print("点击了第$index 条数据");
                    Navigator.pop(context,_cureentStation);
                  },
                );
              },
              itemCount: stations.length,

            ),
            Positioned(
              width: Constants.IndexBarWith,
              right: 0.0,
              top: 0.0,
              bottom: 0.0,
              //top :0, bottom:0 充满整个高度
              child: Column(
                children: _letters,
              ),
            ),
          ],
        );
      },
    );
  }

}

/*    return  snapshot.data.map<Widget>((item) {
          ListTile(
            leading: Icon(Icons.flight),
            title: Text(item.name),
            subtitle: Text(item.quanpin),
          );
        }).toList();
*/
