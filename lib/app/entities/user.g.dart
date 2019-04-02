// GENERATED CODE - DO NOT MODIFY BY HAND

part of user;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<User> _$userSerializer = new _$UserSerializer();

class _$UserSerializer implements StructuredSerializer<User> {
  @override
  final Iterable<Type> types = const [User, _$User];
  @override
  final String wireName = 'User';

  @override
  Iterable serialize(Serializers serializers, User object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'username',
      serializers.serialize(object.username,
          specifiedType: const FullType(String)),
      'avatar',
      serializers.serialize(object.avatar,
          specifiedType: const FullType(String)),
      'todos',
      serializers.serialize(object.todoMaps,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Map)])),
    ];

    return result;
  }

  @override
  User deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'avatar':
          result.avatar = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'todos':
          result.todoMaps.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Map)]))
              as BuiltList);
          break;
      }
    }

    return result.build();
  }
}

class _$User extends User {
  @override
  final String username;
  @override
  final String avatar;
  @override
  final BuiltList<Map> todoMaps;

  factory _$User([void updates(UserBuilder b)]) =>
      (new UserBuilder()..update(updates)).build();

  _$User._({this.username, this.avatar, this.todoMaps}) : super._() {
    if (username == null) {
      throw new BuiltValueNullFieldError('User', 'username');
    }
    if (avatar == null) {
      throw new BuiltValueNullFieldError('User', 'avatar');
    }
    if (todoMaps == null) {
      throw new BuiltValueNullFieldError('User', 'todoMaps');
    }
  }

  @override
  User rebuild(void updates(UserBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  UserBuilder toBuilder() => new UserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
        username == other.username &&
        avatar == other.avatar &&
        todoMaps == other.todoMaps;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, username.hashCode), avatar.hashCode), todoMaps.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('User')
          ..add('username', username)
          ..add('avatar', avatar)
          ..add('todoMaps', todoMaps))
        .toString();
  }
}

class UserBuilder implements Builder<User, UserBuilder> {
  _$User _$v;

  String _username;
  String get username => _$this._username;
  set username(String username) => _$this._username = username;

  String _avatar;
  String get avatar => _$this._avatar;
  set avatar(String avatar) => _$this._avatar = avatar;

  ListBuilder<Map> _todoMaps;
  ListBuilder<Map> get todoMaps => _$this._todoMaps ??= new ListBuilder<Map>();
  set todoMaps(ListBuilder<Map> todoMaps) => _$this._todoMaps = todoMaps;

  UserBuilder();

  UserBuilder get _$this {
    if (_$v != null) {
      _username = _$v.username;
      _avatar = _$v.avatar;
      _todoMaps = _$v.todoMaps?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(User other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$User;
  }

  @override
  void update(void updates(UserBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$User build() {
    _$User _$result;
    try {
      _$result = _$v ??
          new _$User._(
              username: username, avatar: avatar, todoMaps: todoMaps.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'todoMaps';
        todoMaps.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'User', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
