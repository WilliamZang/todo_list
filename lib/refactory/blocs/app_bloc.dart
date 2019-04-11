
import 'package:todo_list/framework/bloc/bloc.dart';
import 'package:todo_list/refactory/blocs/login_bloc.dart';
import 'package:todo_list/refactory/blocs/todo_list_bloc.dart';
import 'package:todo_list/refactory/events/events.dart';

class AppBloc extends Bloc<AppEvent, Null> {
  AppBloc(): super(null) {
    loginBloc.appBloc = this;
    todoListBloc.appBloc = this;
  }
  LoginBloc loginBloc = LoginBloc();
  TodoListBloc todoListBloc = TodoListBloc();

  @override
  Stream<Null> handleEvent(AppEvent event, {Null lastState}) {
    // TODO: implement handleEvent
    return null;
  }
}