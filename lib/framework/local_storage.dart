import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class LocalStorage {
  static final Map<String, LocalStorage> _cache = new Map();

  factory LocalStorage(String key) {
    if (_cache.containsKey(key)) {
      return _cache[key];
    } else {
      final instance = LocalStorage._internal(key);
      _cache[key] = instance;

      return instance;
    }
  }

  dynamic operator [](String key) => _data[key];
  operator []=(String key, value) {
    set(key, value);
  }

  Future<void> set(String key, value) async {
    _data[key] = value;
    return _flush();
  }

  Future<void> remove(String key) async {
    _data.remove(key);
    return _flush();
  }

  Future<void> clear() {
    _data.clear();
    return _flush();
  }

  StorageTypedProperty<int> get intOf => StorageTypedProperty(this);
  StorageTypedProperty<num> get numOf => StorageTypedProperty(this);
  StorageTypedProperty<bool> get boolOf => StorageTypedProperty(this);
  StorageTypedProperty<String> get stringOf => StorageTypedProperty(this);
  StorageTypedProperty<List> get listOf => StorageTypedProperty(this);
  StorageTypedProperty<Map<String, dynamic>> get mapOf => StorageTypedProperty(this);

  LocalStorage._internal(String key) {
    _filename = key;
    _data = new Map();

    _lock = this._init();
  }

  Future<Directory> _getDocumentDir() => getApplicationDocumentsDirectory();

  Future<void> _init() async {
    try {
      final Directory documentDir = await _getDocumentDir();
      final String path = documentDir.path;

      _file = File('$path/$_filename.json');

      bool exists = _file.existsSync();

      if (exists) {
        final content = await _file.readAsString();

        try {
          _data = json.decode(content);
        } catch (err) {
          _data = {};
          _file.writeAsStringSync('{}');
        }
      } else {
        _file.writeAsStringSync('{}');
        return _init();
      }
    } on Error catch (_) {
      rethrow;
    }
  }

  Future<void> _flush() async {
    if (_lock != null) {
      await _lock;
    }

    _lock = _flushToDisk();

    return _lock;
  }

  Future<void> _flushToDisk() async {
    final serialized = json.encode(_data);
    try {
      await _file.writeAsString(serialized);
    } catch (e) {
      rethrow;
    }
  }

  String _filename;
  File _file;
  Map<String, dynamic> _data;

  Future<void> _lock;
}

class StorageTypedProperty<T> {
  StorageTypedProperty(this._localStorage);

  T operator [](String key) => _localStorage[key];
  operator []=(String key, T value) {
    _localStorage[key] = value;
  }

  Future<void> set(String key, value) => _localStorage.set(key, value);

  final LocalStorage _localStorage;
}
