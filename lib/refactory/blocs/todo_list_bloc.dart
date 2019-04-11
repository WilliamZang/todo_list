
import 'package:todo_list/framework/bloc/bloc.dart';
import 'package:todo_list/refactory/blocs/app_bloc.dart';
import 'package:todo_list/refactory/events/todos_events.dart';
import 'package:todo_list/refactory/entities/todo.dart';

class TodoListBloc extends Bloc<TodoEvent, List<Todo>> {
  AppBloc appBloc;

  TodoListBloc() : super([]);

  @override
  Stream handleEvent(event, {lastState}) {
    // TODO: implement handleEvent
    return null;
  }
}