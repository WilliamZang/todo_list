library user_login;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'serializers.dart';
part 'user_login.g.dart';

abstract class UserLogin implements Built<UserLogin, UserLoginBuilder> {
  UserLogin._();

  factory UserLogin([updates(UserLoginBuilder b)]) = _$UserLogin;

  @BuiltValueField(wireName: 'username')
  String get username;
  @BuiltValueField(wireName: 'password')
  String get password;
  String toJson() {
    return json.encode(serializers.serializeWith(UserLogin.serializer, this));
  }

  static UserLogin fromJson(String jsonString) {
    return serializers.deserializeWith(
        UserLogin.serializer, json.decode(jsonString));
  }

  static Serializer<UserLogin> get serializer => _$userLoginSerializer;
}
