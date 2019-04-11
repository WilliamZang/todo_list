import 'package:flutter/services.dart';
import 'package:todo_list/framework/bloc/bloc.dart';
import 'package:todo_list/app/entities/entities.dart';
import 'package:todo_list/app/models/user_model.dart';

const platform = const MethodChannel('williamzang.com.qrShow');

class QREvent {

}

class AppBloc {
  TodoListBloc _bloc1 = TodoListBloc(this);
  WSBlock bloc2;
  UserBloc bloc3;
}


BlocBuilder(
bloc: BlocProvider.of<AppBloc>(context).bloc2;
)
class TodoListBloc extends Bloc<dynamic, List<Todo>> {
  TodoListBloc() : super([]);
AppBloc appBloc;
  @override
  Stream<List<Todo>> handleEvent(event, {List<Todo> lastState}) async* {
    if (event is QREvent) {
      String result = await platform.invokeMethod('qrShow', {"a": "b"});
      appBloc._bloc2.dispatch(result);
      ws = WSClient.startWebSocket(result);
      yield* ws.stream;
    } else {
      yield await model.getAll(null);
    }
  }

//  Stream<List<Todo>> handleEvent_(event, {List<Todo> lastState}) {
//    StreamController c = StreamController();
//    model.getAll(null).then((List<Todo> todos) {
//      c.sink.add(todos);
//    });
//    return c.stream;
//  }

  TodoListModel model = TodoListModel();
}