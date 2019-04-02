import 'package:flutter/material.dart';
import 'package:todo_list/app/pages/register.dart';
import 'package:todo_list/framework/pages/todo_list_page.dart';
import 'package:todo_list/main.dart';

class LoginPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final logo = CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 48.0,
      child: Image.asset('images/flutter.png'),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      controller: emailController,
      decoration: InputDecoration(
        hintText: '邮箱',
      ),
    );

    final password = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: passwordController,
      decoration: InputDecoration(
        hintText: '密码',
      ),
    );

    final loginButton = FlatButton(
      onPressed: () {
        print(emailController.text);
        print(passwordController.text);
        // TODO: 网络请求
        MyProvider.of(context).dispatch(
            LoginActionEvent(emailController.text, passwordController.text));
        //Navigator.of(context).push(MaterialPageRoute(builder: (context) => TodoListPage()));
      },
      child: Column(
        children: <Widget>[
          Image.asset('images/register.png', width: 50, height: 50),
          Text('登录', style: TextStyle(color: Colors.black)),
        ],
      ),
    );

    final registerButton = FlatButton(
      onPressed: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => RegisterPage())),
      child: Column(
        children: <Widget>[
          Image.asset('images/login.png', width: 50, height: 50),
          Text('注册', style: TextStyle(color: Colors.black)),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          logo,
          SizedBox(height: 10),
//          StreamBuilder(
//            stream: MyProvider.of(context).loginState,
//            builder: (BuildContext context, AsyncSnapshot<bool> state) {
//              return Text('${state.hasData && state.data ? '已登录' : '未登录'}',
//                  style: TextStyle(fontSize: 24));
//            },
//          ),
//          StreamBuilder(
//            stream: MyProvider.of(context).loginUsername,
//            builder: (BuildContext context, AsyncSnapshot<String> state) {
//              String name = "请登录";
//              if (state.hasData) {
//                name = state.data;
//              }
//              return Text(name,
//                  style: TextStyle(fontSize: 24));
//            },
//          ),
          SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.only(left: 24, right: 24),
            child: email,
          ),
          Padding(
            padding: EdgeInsets.only(left: 24, right: 24),
            child: password,
          ),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              registerButton,
              loginButton,
            ],
          )
        ],
      )),
    );
  }
}
