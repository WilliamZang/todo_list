

import 'package:todo_list/framework/bloc/bloc.dart';
import 'package:todo_list/refactory/blocs/app_bloc.dart';
import 'package:todo_list/refactory/entities/user.dart';
import 'package:todo_list/refactory/events/login_event.dart';
import 'package:web_socket_channel/web_socket_channel.dart';


class LoginBloc extends Bloc<LoginEvent, User> {
  LoginBloc(): super(null);

  AppBloc appBloc;
  @override
  Stream<User> handleEvent(LoginEvent event, {User lastState}) async* {
    yield User("aaa", "aaaa");
  }


}
typedef void TaskDispatch(TaskEvent event);

class TaskListBloc extends Bloc<TaskEvent, List<Task>> {
  TaskListBloc(): super([], BlocMode.Switch) {
    userModel.topic.stream.map((topic) => TaskEvent(topic)).listen(dispatch);

  }
  UserModel userModel = globalUsermODEL;
  hanleEvent(TaskEvent event, {List<Task> lastTasks}) {
    if (event is TaskAddEvent) {

    }
    if (event is TaskRemoveEvent) {

    }
  }
}

class UserModel {
  WebSocketChannel _channel;
  StreamController topic = StreamController();

  dispose() {
    topic.close();
  }
  Future<User> Login(username, password) async {
    dio ...;
    _chanel = ...;
    channelSubscribe();
    return user;
  }

  logout() async {
_channel.close();

  }
}



  channelSubscribe() {
    topic.addStream(_channel.stream.map(Topic.fromJSON));
    _channel.stream.listen((T){}, onDone: (){
      // 重连
    }, onError: () {
      _chanel = ...;
      channelSubscribe();
    })
  }

}

