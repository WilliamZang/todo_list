import 'serializers.dart';
import 'dart:convert';

class TodoServiceResponse {
  final int stateCode;
  final String errorMsg;
  final dynamic data;

  TodoServiceResponse(this.stateCode, this.errorMsg, this.data);

  @override
  Map<String, dynamic> toJSON() {
    throw "not need";
  }

  factory TodoServiceResponse.fromJSONString(String jsonString) {
    return TodoServiceResponse.fromJSON(json.decode(jsonString));
  }

  factory TodoServiceResponse.fromJSON(Map<String, dynamic> json) {
    return TodoServiceResponse(
        json['stateCode'], json['errorMsg'], (json['data']));
  }
}
