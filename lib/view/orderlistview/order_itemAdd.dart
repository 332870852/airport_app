import 'package:flutter/material.dart';
import '../myinfoView/myPerson_contacts_add.dart';
import 'package:airport_app/utils/nativeDb.dart';
import 'package:airport_app/utils/constants.dart' show AppColors, AppStyle, Constants;

//enum Action { Ok, Cancel }
//bool tickFlag=false;


class OrderItem extends StatefulWidget {

  OrderItem({Key key}) : super(key: key);

  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  List<bool> _flags=[false];
  final textEditingController = TextEditingController();
  PersonInfoProvider _infoProvider = new PersonInfoProvider();
  List<PersonInfo> _personInfos = [];

  @override
  void initState() {
    super.initState();
    _infoProvider.getAll().then((onValue) {
      setState(() {
        if (onValue.length > 0)
        {
          _personInfos.addAll(onValue);
          for(int i=0;i<onValue.length-1;i++){
            _flags.add(false);
          }
        // print("-----------${_flags.toString()}");
        }
      });
    }).catchError((onError) {
      debugPrint(onError.toString());
    });

    textEditingController.addListener(() {
      debugPrint('input: ${textEditingController.text}');
    });
  }

  @override
  void dispose() {
    //释放
    textEditingController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '选择乘客',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0.0,
        centerTitle: true,
       /* leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.green,), onPressed: (){
          Navigator.pop(context);
        }),*/
        actions: <Widget>[
          FlatButton(
            child: Text(
              '完成',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            onPressed: () {
              int i=0;
              List<int> _ids=[]; //返回id数组
              debugPrint("添加");
                _flags.forEach((item){
                  if(item){
                     _ids.add(_personInfos[i].id);
                  }
                  i++;
                });
                Navigator.pop(context,_ids); //返回页面
                print(_ids);
            },
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: _personInfos.length + 1,
          itemBuilder: (BuildContext ctx, int index) {
            if (index == 0) {
              return Container(
                width: 100.0,
                height: 50.0,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            controller: textEditingController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                              hintText: '请输入姓名关键字',
                              filled: true,
                              border: InputBorder.none,
                              hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 18.0),
                            ),
                            style:
                            TextStyle(fontSize: 18.0, color: Colors.black),
                            onChanged: (value) {
                              print("搜索输入的值$value");
                              if (value.length > 0) {
                                _infoProvider.getLike(value).then((onValue) {
                                  if (onValue.length > 0) {
                                    //查出数据刷新
                                    setState(() {
                                      _personInfos = onValue;
                                    });
                                  }
                                });
                              }else{//没有输入内容显示所有数据
                                _infoProvider.getAll().then((onValue1){
                                  setState(() {
                                    if(onValue1.length>0)
                                    _personInfos=onValue1;
                                  });
                                });
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: Color(AppColors.DividerColor),
                            width: Constants.DividerWith)),
                    color: Colors.white),
              );
            }
            return Container(
              height: 65.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          height: 10.0,
                          color: Color(AppColors.DividerColor),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Checkbox(
                          onChanged: (value){
                            print(index);
                            setState(() {
                              _flags[index-1]=value;
                            });
                          },
                          value: _flags[index-1],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            _personInfos[index - 1].username,
                            style: AppStyle.PersonItemTextStyle,
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Text(
                            _personInfos[index - 1].type,
                            style: AppStyle.PersonItemTextStyle,
                          )),
                      Expanded(
                          flex: 5,
                          child: Text(
                            _personInfos[index - 1].identifyId,
                            style: AppStyle.PersonItemTextStyle,
                          )),

                    ],
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Color(AppColors.DividerColor),
                          width: Constants.DividerWith)),
                  color: Colors.white),
            );
          }),
    );
  }
}


