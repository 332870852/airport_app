import 'package:json_annotation/json_annotation.dart';
import 'AdminItem.dart';

part 'AirItem_list.g.dart';
/**
* API: qianmi.elife.air.items.list response.
*
*/
@JsonSerializable()
class AirItemsList extends Object  {//with $AirItemsListSerializerMixin
  /**
   * 可选择的火车票标准商品信息
   */
  AdminItem items;
  /**
   * 页码 从0开始
   */
  int pageNo;

  /**
   * 单页返回的记录数
   */
  int pageSize;
  /**
   * 总记录数
   */
  int totalCount;

  AirItemsList(this.items, this.pageNo, this.pageSize, this.totalCount);

  @override
  String toString() {
    return 'AirItemsList{items: $items, pageNo: $pageNo, pageSize: $pageSize, totalCount: $totalCount}';
  }

  factory AirItemsList.fromJson(Map<String, dynamic> json) =>
      _$AirItemsListFromJson(json);

  Map<String, dynamic> toJson() => _$AirItemsListToJson(this);

}
