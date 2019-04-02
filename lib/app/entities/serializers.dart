library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'todo.dart';
import 'user.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  Todo,
  User,
])

final Serializers serializers = _$serializers;