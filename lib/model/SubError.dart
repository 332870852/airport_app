import 'package:json_annotation/json_annotation.dart';
part 'SubError.g.dart';
@JsonSerializable()
class SubError extends Object {//with _$SubErrorSerializerMixin
  String code;
  String message;
  SubError(this.code, this.message);

  @override
  String toString() {
    return 'SubError{code: $code, message: $message}';
  }

  factory SubError.fromJson(Map<String, dynamic> json) => _$SubErrorFromJson(json);

  Map<String, dynamic> toJson() => _$SubErrorToJson(this);
}