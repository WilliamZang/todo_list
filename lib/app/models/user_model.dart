
import '../entities/entities.dart';
import 'package:todo_list/app/todoService.dart';

// 全局
class AppModel {

}

// 用户登录、登出相关
class AuthModel {

}

// 用户单体相关
class UserModel {
  User _user;
  User get user => _user;
}

// 当前用户
class CurrentUserModel extends UserModel {
  static CurrentUserModel currentUserModel;
}

// TODO列表
class TodoListModel {
//  List<TodoDetailModel> _todos;

  Future<List<Todo>> getAll(User user, [String query]) {
    return todoService.getAllTodo(user, query);
  }

//  List<Todo> newTodo(Todo todo) async {
//    // cache
//    return await getAll(currentUserModel.user);
//  }
//
//  List<Todo> remove(Todo someTodo) {
//
//  }
}

class TodoDetailModel {
  Todo _todo;

  TodoDetailModel(this._todo);
}

class TodoEditModel {
  Todo _todo;

//  Todo update(body) {
//
//  }
//
//  Todo commit() async {
//
//  }
}

//class TodoAddModel {
//  Todo _todo;
//
//  Todo update(body) {
//    _todo = _todo.rebuild(body);
//  }
//
//  Todo commit() async {
//    return await todoService.addNewTodo({
//      "user": currentUserModel.user.username,
//      "todo": _todo.toJson()
//    });
//  }
//}
