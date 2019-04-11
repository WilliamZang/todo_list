library serializers;

import 'todo.dart';
import 'user.dart';

abstract class JSONSerializable {
  dynamic toJSON();
}

typedef JSONSerializable JSONSerializeFunction(Map<String, dynamic> json);

class JSONSerializes {
  Map<Type, JSONSerializeFunction> _serializeMap = {
    Todo: (Map m) => Todo.fromJSON(m),
  };
  T fromJSON<T extends JSONSerializable>(Map<String, dynamic> json) {
    return _serializeMap[T](json) as T;
  }
}

final JSONSerializes jsonSerializes = JSONSerializes();