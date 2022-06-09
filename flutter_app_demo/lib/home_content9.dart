import 'package:flutter_app_demo/res/list_data_bean.dart';
import 'package:flutter/material.dart';
///wrap组件-类似于流布局
///
class MyDemoApp9 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("flutterDemo"),
        ),
        body: WrapContent(),
      ),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

class WrapContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 600,
      color: Colors.green,
      child: Wrap(
        //水平间距
        spacing: 15,
        //垂直间距
        runSpacing: 0,
        direction: Axis.horizontal,
        runAlignment: WrapAlignment.start,
        //alignment: WrapAlignment.spaceBetween,
        children: <Widget>[
          MyButton("第1集"),
          MyButton("第2集"),
          MyButton("第3集"),
          MyButton("第4集"),
          MyButton("第5集"),
          MyButton("第6集"),
          MyButton("第7集"),
          MyButton("第8集"),
          MyButton("第9集"),
          MyButton("第10集"),
        ],
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final String text;

  MyButton(this.text,{Key? key}):super(key: key) {}

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {

      },
      child: Text(text),

    );
  }

}
