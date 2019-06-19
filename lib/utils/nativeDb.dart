import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sql.dart';
import 'package:sqflite/sqflite.dart';
import '../utils/constants.dart';

///
/// 选择乘客信息
List<PersonInfo> select_item = [];

final String DbName = banmaApi.username + ".db";
final String columnId = "_id";
final String ColumnUsername = "username";

class PersonInfo {
  int id;
  String username;
  String identifyId;
  String type;
  num telphone;

  PersonInfo(
      {this.id, this.username, this.identifyId, this.type, this.telphone});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "username": username,
      "identifyId": identifyId,
      "telphone": telphone,
      "type": type
    };

    return map;
  }

  @override
  String toString() {
    return 'PersonInfo{id: $id, username: $username, identifyId: $identifyId, type: $type, telphone: $telphone}';
  }

  PersonInfo.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    username = map['username'];
    identifyId = map['identifyId'];
    type = map['type'];
    telphone = map['telphone'];
  }
}

class PersonInfoProvider {
  final String tableName = "PersonInfo"; //表名
  Database db;

  Future<String> get _dbPath async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DbName);
    return path;
  }

  Future<Database> open() async {
    final path = await _dbPath;
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'create table $tableName (_id integer primary key autoincrement, '
          'username text not null,'
          'identifyId text not null,'
          'type text not null,'
          'telphone num)');
    });
    return db;
  }

  //插入
  Future<PersonInfo> insert(PersonInfo person) async {
    db = await open();
    person.id = await db.insert(tableName, person.toMap());
    return person;
  }

  //查一条数据
  Future<PersonInfo> getPersonInfo(int id) async {
    db = await open();
    List<Map> maps = await db.query(tableName,
        columns: [columnId, "username", "identifyId", "type","telphone"],
        where: "$columnId = ?",
        whereArgs: [id]);
    if (maps.length > 0) {
      return PersonInfo.fromMap(maps.first);
    }
    return null;
  }

  //删除
  Future<int> delete(int id) async {
    db = await open();
    int reslut =
        await db.delete(tableName, where: "$columnId = ?", whereArgs: [id]);
    close();
    return reslut;
  }

  //更新
  Future<int> update(PersonInfo personInfo) async {
    db = await open();
    var result = await db.update(tableName, personInfo.toMap(),
        where: "$columnId = ?", whereArgs: [personInfo.id]);
    close();
    return result;
  }

  //查全部
  Future<List<PersonInfo>> getAll() async {
    db = await open();
    List<Map> maps = await db.query(tableName,
        columns: [columnId, "username", "identifyId","type", "telphone"]);
    if (maps.length > 0) {
      //return  PersonInfo.fromMap(maps);
      List<PersonInfo> lists =
          maps.map((item) => PersonInfo.fromMap(item)).toList();
      return lists;
    }
    return null;
  }

  /**
   * 模糊查询
   */
  ///
  Future<List<PersonInfo>> getLike(String like) async {
    db = await open();
    List<Map> list= await db.rawQuery('SELECT * FROM $tableName WHERE username like "%$like%"');
    //print(list.toString());
    List<PersonInfo> persons=list.map((item)=>PersonInfo.fromMap(item)).toList();
    return persons;
  }

  Future close() async => db.close();
}
