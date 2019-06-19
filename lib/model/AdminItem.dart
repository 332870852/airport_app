import 'package:json_annotation/json_annotation.dart';

part 'AdminItem.g.dart';

@JsonSerializable()
class AdminItem extends Object{//with $AdminItemSerializerMixin
  /**
   * 标准商品进价
   */
  String inPrice;

  /**
   * 标准商品编号
   */
  String itemId;

  /**
   * 标准商品名称
   */
  String itemName;

  AdminItem(this.inPrice, this.itemId, this.itemName);

  @override
  String toString() {
    return 'AdminItem{inPrice: $inPrice, itemId: $itemId, itemName: $itemName}';
  }

  factory AdminItem.fromJson(Map<String, dynamic> json) =>
      _$AdminItemFromJson(json);

  Map<String, dynamic> toJson() => _$AdminItemToJson(this);
}
