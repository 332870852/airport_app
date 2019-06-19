import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sql.dart';
import 'package:sqflite/sqflite.dart';
import '../utils/constants.dart';


final String DbName = banmaApi.username + "TicketInfo.db";
final String columnId = "_id";
final String ColumnUsername = "username";


class TicketInfo{

  int id;
  String tradeNo;  //订单号
  int billState;   //支付状态
  String ctime;

  TicketInfo({this.id, this.tradeNo, this.billState, this.ctime});

  @override
  String toString() {
    return 'TicketInfo{id: $id, tradeNo: $tradeNo, billState: $billState, ctime: $ctime}';
  } //下单时间

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "tradeNo": tradeNo,
      "billState": billState,
      "ctime": ctime
    };

    return map;
  }

  TicketInfo.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    tradeNo = map['tradeNo'];
    billState = map['billState'];
    ctime = map['ctime'];
  }
}


class TicketInfoProvider {
  final String tableName = "TicketInfo"; //表名
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
                  'tradeNo text not null,'
                  'billState num not null,'
                  'ctime text)');
        });
    return db;
  }

  //插入
  Future<TicketInfo> insert(TicketInfo ticket) async {
    db = await open();
    ticket.id = await db.insert(tableName, ticket.toMap());
    return ticket;
  }

  //查一条数据 Id
  Future<TicketInfo> getTicketInfo(int id) async {
    db = await open();
    List<Map> maps = await db.query(tableName,
        columns: [columnId, "tradeNo", "billState", "ctime"],
        where: "$columnId = ?",
        whereArgs: [id]);
    if (maps.length > 0) {
      return TicketInfo.fromMap(maps.first);
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
  Future<int> update(TicketInfo ticketinfo) async {
    db = await open();
    var result = await db.update(tableName, ticketinfo.toMap(),
        where: "$columnId = ?", whereArgs: [ticketinfo.id]);
    close();
    return result;
  }

  //查全部
  Future<List<TicketInfo>> getAll() async {
    db = await open();
    List<Map> maps = await db.query(tableName,
        columns: [columnId, "tradeNo", "billState","ctime"]);
    if (maps.length > 0) {
      //return  PersonInfo.fromMap(maps);
      List<TicketInfo> lists =
      maps.map((item) => TicketInfo.fromMap(item)).toList();
      return lists;
    }
    return null;
  }

  //查一条数据 tradeNo
/*  Future<TicketInfo> getTicketInfoBytradeNo(int id) async {
    db = await open();
    List<Map> maps = await db.query(tableName,
        columns: [columnId, "tradeNo", "billState", "ctime"],
        where: "$columnId = ?",
        whereArgs: [id]);
    if (maps.length > 0) {
      return TicketInfo.fromMap(maps.first);
    }
    return null;
  }*/

  Future close() async => db.close();
}
