import 'package:flutter/material.dart';

class banmaApi {
  ///用户
  static String username = "A3007300";
  ///用户联系电话
  static String userPhone="15278390445";

  static String serverUrl = "http://api.bm001.com/api";
  static String appKey = "10001871";
  static String appSecret = "ppdF4lxpDZBP9bnoZf8SFRBacM0iNAnk";
  static String acceessToken = "4662eab4735d40c0ab3366ba38511f12";
  static String v = "1.1";

  /**  飞机票商品ID **/
  static String itemId = "5500301";

  /** 默认时间格式 **/
  static final String DATE_TIME_FORMAT = "yyyy-MM-dd HH:mm:ss";

  /** Date默认时区 **/
  static final String DATE_TIMEZONE = "GMT+8";

  /** UTF-8字符集 **/
  static final String CHARSET_UTF8 = "UTF-8";

  /** GBK字符集 **/
  static final String CHARSET_GBK = "GBK";

  /** JSON 应格式 */
  static final String FORMAT_JSON = "json";

  /** MD5签名方式 */
  static final String SIGN_METHOD_MD5 = "md5";

  /** HMAC签名方式 */
  static final String SIGN_METHOD_HMAC = "hmac";

  /** 授权地址 */
  static final String PRODUCT_AUTH_URL = "http://oauth.bm001.com/token";

  /** SDK版本号 */
  static final String SDK_VERSION = "qianmi-open-sdk-java-20181023";

  /** 返回的错误码 */
  static final String ERROR_RESPONSE = "error_response";
  static final String ERROR_CODE = "code";
  static final String ERROR_MSG = "msg";
  static final String ERROR_SUB_CODE = "sub_code";
  static final String ERROR_SUB_MSG = "sub_msg";
}

String serverUrl = "http://api.bm001.com/api";
String appKey = "10001871";
String appSecret = "ppdF4lxpDZBP9bnoZf8SFRBacM0iNAnk";
String acceessToken = "4662eab4735d40c0ab3366ba38511f12";

String v = "1.1";
/**  飞机票商品ID **/
String itemId = "5500301";
/** 默认时间格式 **/
final String DATE_TIME_FORMAT = "yyyy-MM-dd HH:mm:ss";

/** Date默认时区 **/
final String DATE_TIMEZONE = "GMT+8";

/** UTF-8字符集 **/
final String CHARSET_UTF8 = "UTF-8";

/** GBK字符集 **/
final String CHARSET_GBK = "GBK";

/** JSON 应格式 */
final String FORMAT_JSON = "json";
/** MD5签名方式 */
final String SIGN_METHOD_MD5 = "md5";
/** HMAC签名方式 */
final String SIGN_METHOD_HMAC = "hmac";
/** 授权地址 */
final String PRODUCT_AUTH_URL = "http://oauth.bm001.com/token";

/** SDK版本号 */
final String SDK_VERSION = "qianmi-open-sdk-java-20181023";

/** 返回的错误码 */
final String ERROR_RESPONSE = "error_response";
final String ERROR_CODE = "code";
final String ERROR_MSG = "msg";
final String ERROR_SUB_CODE = "sub_code";
final String ERROR_SUB_MSG = "sub_msg";

class AppColors {
  static const StationGroupTitleBg = 0xffebebeb;
  static const StationGroupText = 0xff888888;
  static const DividerColor = 0xffd9d9d9;
}

class AppStyle {
  static const GroupTitleItemTextStyle = TextStyle(
    fontSize: 14.0,
    color: Color(AppColors.StationGroupText),
  );

  static const PersonItemTextStyle=TextStyle(color: Colors.green,fontSize: 16.0);
}

class Constants {
  static const IconFontFamily = "appIconFont";
  static const ConversationAvatarSize = 64.0;
  static const DividerWith = 1.0;

  static const UnreadMsgNotifyDotSize = 20.0;
  static const ConversationMuteSize = 18.0;

  static const DeviceInfoItemHeight = 32.0;
  static const ContactAvatarSize = 30.0;
  static const IndexBarWith = 24.0;
}

List<String> week_map = [
  '',
  '周一',
  '周二',
  '周三',
  '周四',
  '周五',
  '周六',
  '周日',
  '',
];

