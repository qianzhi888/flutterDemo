import 'dart:collection';

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  Map? arguments;

  LoginPage({this.arguments});

  @override
  _LoginPageState createState() => _LoginPageState(arguments: arguments);
}

class _LoginPageState extends State<LoginPage> {
  final arguments;

  _LoginPageState({this.arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登录"),
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Text(
                "用户名：${arguments["user_name"]}   密码: ${arguments["password"]}",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  ///返回
                  Navigator.of(context).pop();
                },
                child: Text("登录"),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue)),
              )
            ],
          ),
          color: Colors.white),
    );
  }
}
