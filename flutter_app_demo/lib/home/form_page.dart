import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  final arguments;

  FormPage({this.arguments, Key? key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState(arguments: arguments);
}

class _FormPageState extends State<FormPage> {
  final arguments;

  _FormPageState({this.arguments = "表单页面"}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Text("返回"),
          onPressed: () {
            ///返回上一级
            Navigator.of(context).pop();
          },
        ),
        appBar: AppBar(
          title: Text("表单页面"),
        ),
        body: Container(
          color: Colors.blue,
          child: Text("接收的值为：${arguments != null ? arguments["userId"] : "0"}"),//取出路由中传入的值
        ));
  }
}
