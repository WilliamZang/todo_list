import 'package:flutter/material.dart';
import 'package:todo_list/framework/bloc/bloc.dart';
import 'package:todo_list/framework/pages/todo_list.dart';

void main() => runApp(MyApp());

class TestBloc extends Bloc<int, int> {
  TestBloc() : super(0);
  @override
  Stream<int> handleEvent(int event, {int lastState}) async* {
    yield event + lastState;
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
      home: BlocProvider(TestBloc(),
          child: MyHomePage(title: 'Flutter Demo Home Page')),
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
