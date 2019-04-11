
import 'package:todo_list/refactory/entities/login.dart';
import 'package:todo_list/refactory/events/events.dart';

class LoginEvent extends AppEvent {
  final Login data;
  LoginEvent(this.data);
}