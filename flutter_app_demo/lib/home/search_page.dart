import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("搜索"),
        ),
        body: Container(
          child: Text("我是搜索"),
          color: Colors.green,
          alignment: Alignment.center,
        ));
  }
}
