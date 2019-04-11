import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:json_annotation/json_annotation.dart';
import 'serializers.dart';
import 'dart:convert';

class Todo extends JSONSerializable {
  final int id;
  final String title;
  final String text;
  final DateTime endDate;
  final bool checked;

  Todo({this.id, this.title, this.text, this.endDate, this.checked});

  @override
  Map<String, dynamic> toJSON() {
    // TODO: implement toJSON
    return {
      "id": id,
      "title": title,
      "text": text,
      "endDate": endDate,
      "checked": checked,
    };
  }

  factory Todo.fromJSON(Map<String, dynamic> map) {
    return Todo(
        id: map["id"],
        title: map["title"],
        text: map["text"],
        endDate: map["endDate"],
        checked: map["checked"]);
  }
}

class TodoList extends List<Todo> implements JSONSerializable {
  @override
  dynamic toJSON() {
    return toList().map((t) => t.toJSON());
  }

  factory TodoList.fromJSON(List<Map<String, dynamic>> json) {
    return null;
  }

}