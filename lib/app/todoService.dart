import 'package:dio/dio.dart';

import 'package:todo_list/app/entities/entities.dart';

String todoSeverHost = "http://localhost:3000/";

class Todo1ServiceClient {
  final Dio _dio;
  String _userToken;
  String get userToken => _userToken;

  TodoService():_dio = Dio() {
    _dio.options.baseUrl = todoSeverHost;
  }

  Future<User> login() {
    //...
    //_userToken = ...
  }

  Future<List<Todo>> getAllTodo(User user, String query) async {
    Response<Map> response = await _dio.get('/users/${user.username}/todos',queryParameters: {
      "user": user.username,
      "query": query,
      "token": _userToken,
    });
    Map data = response.data;
    TodoServiceReponse todoServiceReponse= TodoServiceReponse.fromJSON(data);
    if (response.statusCode == 200) {
      TodoList todolist = TodoList.fromJSON(todoServiceReponse.data);
      return todolist;
    }
    throw "1";
  }
}

final todoService = TodoService();
