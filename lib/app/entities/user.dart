library user;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'serializers.dart';
import 'todo.dart';
part 'user.g.dart';

abstract class User implements Built<User, UserBuilder> {
  User._();

  factory User([updates(UserBuilder b)]) = _$User;

  @BuiltValueField(wireName: 'username')
  String get username;
  @BuiltValueField(wireName: 'avatar')
  String get avatar;

  @BuiltValueField(wireName: 'todos')
  BuiltList<Map> get todoMaps;

  BuiltList<Todo> get todos => todoMaps.map((Map m) => Todo.fromJson(m));

  String toJsonString() {
    return json.encode(serializers.serializeWith(User.serializer, this));
  }

  static User fromJsonString(String jsonString) =>
      fromJson(json.decode(jsonString));

  static User fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(User.serializer, json);
  }

  static Serializer<User> get serializer => _$userSerializer;
}
