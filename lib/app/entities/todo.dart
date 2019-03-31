import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';

part 'todo.g.dart';

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
}