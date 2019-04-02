import 'package:flutter/material.dart';
import 'package:todo_list/app/pages/login.dart';
import 'package:todo_list/app/pages/register.dart';
import 'package:todo_list/framework/bloc/bloc.dart';
import 'package:todo_list/framework/pages/todo_list_page.dart';
import 'dart:async';
import 'app/entities/entities.dart';

void main() {
//  test();
  User user = User.fromJsonString(jsonString);

  runApp(MyApp());
}

class LoginBloc {
  Stream<bool> get loginState => _stateController.stream.asBroadcastStream();

  login(String username, String password) {
    bool check = (username == 'a' && password == 'b');
    _stateController.sink.add(check);
  }

  dispose() {
    _stateController.close();
  }

  StreamController<bool> _stateController = StreamController();
}

abstract class LoginEvent {}

class LoginActionEvent extends LoginEvent {
  LoginActionEvent(String username, String password) {
    login = UserLogin((b) => b..username = username
    ..password = password);
    var newlogin = login.rebuild((b) => b..password = 'new');

  }
  UserLogin login;
}
final String jsonString = '''
{
	"username": "william zang",
	"avatar": "aaa",
	"todos": [
		{
			"id": 112,
			"title": "aaaa"
		},
		{
			"id": 112,
			"title": "aaaa"
			
		}
	]
}
''';
class LogoutActionEvent extends LoginEvent {

}

class Login2Bloc {
  Stream<User> currentUser;

  Login2Bloc() {
//    Stream<LoginEvent> event = _eventStream.stream.asBroadcastStream();
//    loginState = event.asyncMap((LoginEvent event) async{
//      if (event is LoginActionEvent) {
//        LoginActionEvent actionEvent = event as LoginActionEvent;
//        bool check = (actionEvent.username == 'f' && actionEvent.password == 'b');
//        return check;
//      } else {
//        return false;
//      }
//    }).asBroadcastStream();
//    loginUsername = event.map((LoginEvent event) {
//      if (event is LoginActionEvent) {
//        LoginActionEvent actionEvent = event as LoginActionEvent;
//        return actionEvent.username;
//      } else {
//        return '未登录';
//      }
//    }).asBroadcastStream();
  }

  dispatch(LoginEvent event) {
    _eventStream.sink.add(event);
  }

  dispose() {
    _eventStream.close();
  }

  StreamController<LoginEvent> _eventStream = StreamController();
}

LoginBloc loginBloc = LoginBloc();

class TestBloc extends Bloc<int, int> {
  TestBloc() : super(0);
  @override
  Stream<int> handleEvent(int event, {int lastState}) async* {
    if (event > 0) {
      yield *eventWhenBigger(event);
    } else if (event == 0) {
      yield *eventWhenZero();
    } else {
      yield event + lastState;
    }
  }

  Stream<int> eventWhenBigger(int event) async*{
    yield event * 2;
  }
  Stream<int> eventWhenZero() async * {
    yield 0;
  }
}

class MyProvider extends InheritedWidget {
  MyProvider(Widget child) : super(child: child);

  Login2Bloc bloc = Login2Bloc();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

  static Login2Bloc of(BuildContext context) {
    MyProvider p = context
            .ancestorInheritedElementForWidgetOfExactType(MyProvider)
            .widget as MyProvider ??
        null;
    return p?.bloc;
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyProvider(LoginPage()),
      //BlocProvider(TestBloc(), child: LoginPage()),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder(
                bloc: BlocProvider.of<TestBloc>(context),
                builder: (BuildContext context, int counter) {
                  return Text(
                    '$counter',
                    style: Theme.of(context).textTheme.display1,
                  );
                }),
          ],
        ),
      ),
      persistentFooterButtons: <FloatingActionButton>[
        FloatingActionButton(
          heroTag: "btn1",
          onPressed: () {
            Route route =
                MaterialPageRoute(builder: (context) => TodoListPage());
            Navigator.push(context, route);
//            TestBloc bloc = BlocProvider.of<TestBloc>(context);
//            bloc.dispatch(1);
          },
          tooltip: 'Add',
          child: Icon(Icons.add),
        ),
        FloatingActionButton(
          heroTag: "btn2",
          onPressed: () {
            TestBloc bloc = BlocProvider.of<TestBloc>(context);
            bloc.dispatch(-1);
          },
          tooltip: 'Sub',
          child: Icon(Icons.remove),
        ),
      ],
    );
  }
}
/**
Iterable<int> pullInts() {
  return [1,2, 3, 4];
}

Iterable<int> fab() sync* {
  int a = 1;
  int b = 1;
  yield a;
  yield b;
  do {
    int c = a + b;
    a = b;
    b = c;
    yield c;
    if (a > 100) break;
  } while(true);
}

Iterable<int> printFab() sync* {
  for (int i = 1; i <= 10; ++i) {
    for (int j = 1; j <= i; ++j) {
      yield *fab().take(j);
    }
  }
}

void test(){
  StreamController<String> text = StreamController<String>();

  Stream<Future<Map<String, dynamic>>> category1 = text.stream.map(getCategory);

  category1.fold(null, (Future<Map<String, dynamic>> prev, Future<Map<String, dynamic>> current) {

  });

  text.sink.add('a');
  text.sink.add('aa');
  text.sink.add('aaa');


//  Iterable<int> p = printFab();
//  for (int item in p) {
//    print(item);
//  }

  return;
  Iterable<int> fabList = fab();

  Iterator<int> i = fabList.iterator;

  i.moveNext();
  i.moveNext();
  i.moveNext();

  for (int item in fabList) {
    print(item);
  }

  return;
  Iterable<int> iterable = pullInts();
  Iterator<int> i = iterable.iterator;
  i.moveNext();
  i.current;
  print(i.current);
  i.moveNext();
  print(i.current);
  for (int item in iterable) {
    print(item);
  }

  return;
  Future<int> f1 = Future.delayed(Duration(seconds: 1), () {
    return 1;
  });
  Future<int> f2 = Future.delayed(Duration(seconds: 2), () {
    return 2;
  });

  f1.then((int value) => "$value")
  .then((String value) {
    print(value);
  });


  f1.then((int value) {
    return Future.delayed(Duration(seconds: value * 2), () {
      return value * 2;
    });
  }).then((int value) {
    print(value);
  });

  Future<List<int>> waitedFuture = Future.wait([f1, f2]);

  waitedFuture.then((List<int> result) {
    assert(result.length == 2);
    assert(result[0] == 1);
    assert(result[1] == 2);
  });

}

// async await
Future<int> getFuture(int nSeconds, int value) { // return Future<int>
  return Future<int>.delayed(Duration(seconds: nSeconds), () {
    return value;
  });
}

Future<String> getString(int nSeconds, String value) async { // return String
  //int _ = await getFuture(1, 0);
  //int _ = await getFuture(2, 1);
  List<int> l = await Future.wait([getFuture(1, 2), getFuture(2, 2)]);
  return value;
}












*/
