import 'package:flutter/material.dart';
import './myPerson_contacts_add.dart';
import 'package:airport_app/utils/nativeDb.dart';
import 'package:airport_app/utils/constants.dart' show AppColors, AppStyle, Constants;

enum Action { Ok, Cancel }

class ContactsView extends StatefulWidget {
  final String title;

  ContactsView({Key key, @required this.title}) : super(key: key);

  _ContactsViewState createState() => _ContactsViewState();
}

class _ContactsViewState extends State<ContactsView> {
  final textEditingController = TextEditingController();
  PersonInfoProvider _infoProvider = new PersonInfoProvider();
  List<PersonInfo> _personInfos = [];


  @override
  void initState() {
    super.initState();
    _infoProvider.getAll().then((onValue) {
      setState(() {
        if (onValue.length > 0) _personInfos.addAll(onValue);
      });
    }).catchError((onError) {
      debugPrint(onError.toString());
    });

    //textEditingController.text = '1'; //设置文本框初始化的值
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

  ///对话框确认
  ///
  Future _openAlertDialog() async {
    final action = await showDialog(
        barrierDismissible: false, //必须选择一个才能关闭
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              child: Text(
                '温馨提示',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
            ),
            content: Text(
              '确认删除该联系人吗?',
              style: TextStyle(color: Colors.grey, fontSize: 20.0),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('返回'),
                onPressed: () {
                  Navigator.pop(context, Action.Cancel);
                },
              ),
              FlatButton(
                child: Text('确定'),
                onPressed: () {
                  Navigator.pop(context, Action.Ok);
                },
              )
            ],
          );
        });

    return action;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
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
          FlatButton(
            child: Text(
              '添加',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            onPressed: () {
              debugPrint("添加");
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext ctx) {
                return AddContactsItem();
              })).then((onValue) {
                // print("返回的值:$onValue");
                _infoProvider.getAll().then((data) {
                  if (data.length > 0) {
                    setState(() {
                      _personInfos = data;
                    });
                  }
                });
              });
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
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          //删除按钮
                          icon: Icon(
                            Icons.delete,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            _openAlertDialog().then((result) {
                              if (result == Action.Ok) {
                                _infoProvider.delete(_personInfos[index - 1].id).then((result){
                                  if(result>0)//删除成功
                                    {//重新加载数据
                                     _infoProvider.getAll().then((onValue){
                                       setState(() {
                                         if(onValue!=null)
                                         _personInfos=onValue;
                                         else
                                           _personInfos=[];
                                       });
                                     });
                                  }
                                });
                              }
                            });
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
          }),
    );
  }
}
