import 'package:flutter/material.dart';
import 'package:airport_app/utils/constants.dart';
import 'package:airport_app/utils/nativeDb.dart';
import 'package:common_utils/common_utils.dart';


class AddContactsItem extends StatefulWidget {
  _AddContactsItemState createState() => _AddContactsItemState();
}

class _AddContactsItemState extends State<AddContactsItem> {
  String person_type = '成人';
  final FormKey = GlobalKey<FormState>();
  String username, identifyId, phone;
  bool autovalidate = false;
  bool submitRegisterForm() {
    //提交表单处理方法
    if (FormKey.currentState.validate()) {
      FormKey.currentState.save(); //保存
      //registerFormKey.currentState.validate();//验证数据有效性
      /*debugPrint('username : $username');
      debugPrint('identifyId : $identifyId');
      debugPrint('phone : $phone');*/
      PersonInfoProvider personInfoProvider = new PersonInfoProvider();

      personInfoProvider
          .insert(PersonInfo(
              username: username,
              identifyId: identifyId,
              telphone: num.parse(phone),
              type: person_type))
          .then((onValue) {
        debugPrint("id: ${onValue.id}");
        if (onValue.id > 0) {
          Navigator.pop(context,true);
          return true;
        }
      });
    } else {
      //失败，开启自动验证数据
      setState(() {
        autovalidate = true;
      });
      //打开对话框
      _openAlertDialog().then((onValue) {
        print("搜到： $onValue");
      }).catchError((onError){
        print(onError);
      });
      return false;
    }

  }

  BoxDecoration _boxDecoration = BoxDecoration(
      border: Border(
          bottom: BorderSide(
              color: Color(AppColors.DividerColor),
              width: Constants.DividerWith)),
      color: Colors.white);

  String validateUsername(value) {
    //判断用户数据

    if (value.isEmpty || value == "") {
      return "姓名不能为空";
    }else if(value.toString().length>5||!RegexUtil.isZh(value)){
      return "请输入小于6位数的中文名";
    }
    return null;
  }

  ///大陆手机号码11位数，匹配格式：前三位固定格式+后8位任意数
  /// 此方法中前三位格式有：
  /// 13+任意数 * 15+除4的任意数 * 18+除1和4的任意数 * 17+除9的任意数 * 147
  static bool isChinaPhoneLegal(String str) {
    return new RegExp('^((13[0-9])|(15[^4])|(166)|(17[0-8])|(18[0-9])|(19[8-9])|(147,145))\\d{8}\$').hasMatch(str);
  }

  String validatePhone(value) {
    if (value.isEmpty || value == "") {
      return '联系号码不能为空';
    }
    for(int i=0;i<value.toString().length;i++){
     if(value.toString().codeUnitAt(i)<48||value.toString().codeUnitAt(i)>57){
       return "联系电话只能为数字";
     }else if(!RegexUtil.isMobileExact(value)){//value.toString().length!=11
       return "请输入11位有效手机号码";
     }
    }
    return null;
  }

  String validateIdentifyId(value) {
    print(value);
    if (value.isEmpty || value == "") {
      return '证件号不能为空';
    }else if(!RegexUtil.isIDCard18Exact(value)){//value.toString().length!=18
      return "请输入18位正确证件号";
    }
    return null;
  }
  Future _openAlertDialog()  async{
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
              '添加联系人失败',
              style: TextStyle(color: Colors.grey, fontSize: 20.0),
            ),
            actions: <Widget>[
              RaisedButton(
                color: Colors.blue,
                child: Text(
                  '确定',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: (){
                  Navigator.pop(context,"true");
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '添加乘车人',
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
              '完成',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            onPressed: () async{
              var v= await submitRegisterForm();
              if(v){
                Navigator.pop(context,true);
              }
            },
          ),
        ],
      ),
      body: Stack(alignment: Alignment.topCenter, children: <Widget>[
        ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 10.0),
              alignment: Alignment.centerLeft,
              height: 35.0,
              child: Text(
                '基本信息',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Color(AppColors.DividerColor),
                          width: Constants.DividerWith)),
                  color: Colors.grey.shade200),
            ),
            //证件类型
            Container(
              padding: EdgeInsets.only(left: 10.0),
              alignment: Alignment.centerLeft,
              height: 50.0,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Text(
                      '证件类型:',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Text(
                      '中国居民身份证',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      icon: Icon(Icons.arrow_forward_ios,
                          color: Colors.grey.shade200),
                      onPressed: () {
                        //null
                      },
                    ),
                  ),
                ],
              ),
              decoration: _boxDecoration,
            ),

            Form(
              key: FormKey,
              child: Column(
                children: <Widget>[
                  //姓名
                  Container(
                    padding: EdgeInsets.only(left: 10.0),
                    alignment: Alignment.centerLeft,
                    height: 60.0,
                    decoration: _boxDecoration,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Text(
                            '姓名:',
                            style:
                                TextStyle(fontSize: 20.0, letterSpacing: 15.0),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: '请输入真实姓名,以方便购票',
                              // hintText: 'please input username',
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade400, fontSize: 20.0),
                              border: InputBorder.none,
                            ),
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.black),
                            onSaved: (value) {
                              // 数据
                              username = value;
                            },
                            validator: validateUsername,
                            autovalidate: autovalidate, //自动验证
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  //证件号码
                  Container(
                    padding: EdgeInsets.only(left: 10.0),
                    alignment: Alignment.centerLeft,
                    height: 60.0,
                    decoration: _boxDecoration,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Text(
                            '证件号码:',
                            style:
                                TextStyle(fontSize: 20.0, letterSpacing: 0.0),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: '用于身份验证,请正确填写',
                              // hintText: 'please input username',
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade400, fontSize: 20.0),
                              border: InputBorder.none,
                            ),
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.black),
                            onSaved: (value) {
                              //保存
                              print(value);
                              // 数据
                              identifyId = value;
                            },
                            validator: validateIdentifyId,
                            autovalidate: autovalidate, //自动验证
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 20.0,
                  ),
                  //旅客类型
                  Container(
                    padding: EdgeInsets.only(left: 10.0),
                    alignment: Alignment.centerLeft,
                    height: 50.0,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Text(
                            '旅客类型:',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Text(
                            person_type,
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                            icon: Icon(Icons.arrow_forward_ios,
                                color: Colors.grey.shade200),
                            onPressed: () {
                              //null
                            },
                          ),
                        ),
                      ],
                    ),
                    decoration: _boxDecoration,
                  ),

                  Container(
                    padding: EdgeInsets.only(left: 10.0),
                    alignment: Alignment.centerLeft,
                    height: 35.0,
                    child: Text(
                      '联系方式',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Color(AppColors.DividerColor),
                                width: Constants.DividerWith)),
                        color: Colors.grey.shade200),
                  ),

                  //手机号码
                  Container(
                    padding: EdgeInsets.only(left: 10.0),
                    alignment: Alignment.centerLeft,
                    height: 50.0,
                    decoration: _boxDecoration,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Text(
                            '手机号码:',
                            style:
                                TextStyle(fontSize: 20.0, letterSpacing: 0.0),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: '请准确填写您的手机号码',
                              // hintText: 'please input username',
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade400, fontSize: 20.0),
                              border: InputBorder.none,
                            ),
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.black),
                            onSaved: (value) {
                              //保存
                              print(value);
                              // 数据
                              phone = value;
                            },
                            validator: validatePhone,
                            autovalidate: autovalidate, //自动验证
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
