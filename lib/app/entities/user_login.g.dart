// GENERATED CODE - DO NOT MODIFY BY HAND

part of user_login;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserLogin> _$userLoginSerializer = new _$UserLoginSerializer();

class _$UserLoginSerializer implements StructuredSerializer<UserLogin> {
  @override
  final Iterable<Type> types = const [UserLogin, _$UserLogin];
  @override
  final String wireName = 'UserLogin';

  @override
  Iterable serialize(Serializers serializers, UserLogin object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'username',
      serializers.serialize(object.username,
          specifiedType: const FullType(String)),
      'password',
      serializers.serialize(object.password,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  UserLogin deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserLoginBuilder();

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
        case 'password':
          result.password = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$UserLogin extends UserLogin {
  @override
  final String username;
  @override
  final String password;

  factory _$UserLogin([void updates(UserLoginBuilder b)]) =>
      (new UserLoginBuilder()..update(updates)).build();

  _$UserLogin._({this.username, this.password}) : super._() {
    if (username == null) {
      throw new BuiltValueNullFieldError('UserLogin', 'username');
    }
    if (password == null) {
      throw new BuiltValueNullFieldError('UserLogin', 'password');
    }
  }

  @override
  UserLogin rebuild(void updates(UserLoginBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  UserLoginBuilder toBuilder() => new UserLoginBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserLogin &&
        username == other.username &&
        password == other.password;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, username.hashCode), password.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserLogin')
          ..add('username', username)
          ..add('password', password))
        .toString();
  }
}

class UserLoginBuilder implements Builder<UserLogin, UserLoginBuilder> {
  _$UserLogin _$v;

  String _username;
  String get username => _$this._username;
  set username(String username) => _$this._username = username;

  String _password;
  String get password => _$this._password;
  set password(String password) => _$this._password = password;

  UserLoginBuilder();

  UserLoginBuilder get _$this {
    if (_$v != null) {
      _username = _$v.username;
      _password = _$v.password;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserLogin other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserLogin;
  }

  @override
  void update(void updates(UserLoginBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$UserLogin build() {
    final _$result =
        _$v ?? new _$UserLogin._(username: username, password: password);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
