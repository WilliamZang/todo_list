import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:json_annotation/json_annotation.dart';
import 'serializers.dart';
import 'dart:convert';
part 'todo.g.dart';



@JsonSerializable()
class TodoObject {
  TodoObject({this.id, this.title, this.text, this.endDate, this.checked});
  int  id;

  String  title;
  String  text;

  DateTime  endDate;

  bool  checked;

  factory TodoObject.fromJson(Map<String, dynamic> json) {
    return TodoObject(id: int.parse(json["id"]),
      title: json["title"],
      text: json["text"] ?? 'xx',
      endDate: DateTime.parse(json["endDate"]),
      checked: json["checked"].toLowerCase() == 'true',);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "title": this.title,
      "text": this.text,
      "endDate": this.endDate.toIso8601String(),
      "checked": this.checked,
    };
  }




}

abstract class Todo implements Built<Todo, TodoBuilder> {
  static Serializer<Todo> get serializer => _$todoSerializer;

  // Can never be null.
  int get id;

  String get title;

  @nullable
  String get text;

  @nullable
  @BuiltValueField(wireName: 'end_date')
  DateTime get endDate;

  @nullable
  bool get checked;

  Todo._();
  factory Todo([updates(TodoBuilder b)]) = _$Todo;

  String toJsonString() {
    return json.encode(serializers.serializeWith(Todo.serializer, this));
  }

  static Todo fromJsonString(String jsonString) =>
      fromJson(json.decode(jsonString));

  static Todo fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Todo.serializer, json);
  }
}