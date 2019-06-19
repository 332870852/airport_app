import 'package:json_annotation/json_annotation.dart';

// user.g.dart 将在我们运行生成命令后自动生成
///这个标注是告诉生成器，这个类是需要生成Model类的
part 'Item.g.dart';

@JsonSerializable()
class Item extends Object{
  /**
   * 建议零售价
   */
  String advicePrice;

  /**
   * 建议零售价设价表达式
   */
  String advicePriceExpression;

  /**
   * 建议零售价设价方式
   */
  String advicePriceOpt;

  /**
   * 面值名称
   */
  String faceName;

  /**
   * 面值
   */
  String facePriceValue;

  /**
   * 商品进价
   */
  String inPrice;

  /**
   * 进价设价表达式
   */
  String inPriceExpression;

  /**
   * 进价设价方式
   */
  String inPriceOpt;

  /**
   * 标准商品对应的小类id
   */
  String itemClassId;

  /**
   * 标准商品ID
   */
  String itemId;

  /**
   * 标准商品名称
   */
  String itemName;

  /**
   * 购买可选数量 1-10 or 1,5,10,20,50
   */
  String numberChoice;

  /**
   * 标准类目编号
   */
  String productCateId;

  /**
   * 充值模板编号
   */
  String rechargeTplid;

  /**
   * 是否支持冲正 1 支持 0 不支持
   */
  String reverseFlag;

  /**
   * 商品库存
   */
  String stock;

  /**
   * 真实供货商id
   */
  String supUserId;

  /**
   * 供货商备注
   */
  String supplyRemark;

  /**
   * 货源类型 1自供货 2小SUP 3其他供货
   */
  String supplyType;

  /**
   * 商品对应的模板id
   */
  String tplId;

  Item(
      this.advicePrice,
      this.advicePriceExpression,
      this.advicePriceOpt,
      this.faceName,
      this.facePriceValue,
      this.inPrice,
      this.inPriceExpression,
      this.inPriceOpt,
      this.itemClassId,
      this.itemId,
      this.itemName,
      this.numberChoice,
      this.productCateId,
      this.rechargeTplid,
      this.reverseFlag,
      this.stock,
      this.supUserId,
      this.supplyRemark,
      this.supplyType,
      this.tplId);

  @override
  String toString() {
    return 'Item{advicePrice: $advicePrice, advicePriceExpression: $advicePriceExpression, advicePriceOpt: $advicePriceOpt, faceName: $faceName, facePriceValue: $facePriceValue, inPrice: $inPrice, inPriceExpression: $inPriceExpression, inPriceOpt: $inPriceOpt, itemClassId: $itemClassId, itemId: $itemId, itemName: $itemName, numberChoice: $numberChoice, productCateId: $productCateId, rechargeTplid: $rechargeTplid, reverseFlag: $reverseFlag, stock: $stock, supUserId: $supUserId, supplyRemark: $supplyRemark, supplyType: $supplyType, tplId: $tplId}';
  }

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
