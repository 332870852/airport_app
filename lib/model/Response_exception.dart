import 'package:json_annotation/json_annotation.dart';
import 'SubError.dart';

part 'Response_exception.g.dart';

@JsonSerializable()
class ResponseException extends Object {//with _$ResponseExceptionSerializerMixin
  String errorToken;
  String code;
  String message;
  String solution;
  List<SubError> subErrors;

  ResponseException(
      this.errorToken, this.code, this.message, this.solution, this.subErrors);

  @override
  String toString() {
    return 'ResponseException{errorToken: $errorToken, code: $code, message: $message, solution: $solution, subErrors: $subErrors}';
  }

  factory ResponseException.fromJson(Map<String, dynamic> json) => _$ResponseExceptionFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseExceptionToJson(this);
}



