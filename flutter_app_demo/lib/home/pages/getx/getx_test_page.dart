import 'package:flutter/material.dart';
import 'package:flutter_app_demo/home/common/router_path.dart';
import 'package:get/get.dart';

class GetXTestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "getx练习",
      home: Scaffold(
        appBar: AppBar(
          title: Text("getx"),
        ),
        body: Column(
          children: <Widget>[
            ElevatedButton(child: Text("跳转到getx实现的计数器页面"), onPressed: () {
              Navigator.pushNamed(context, RouterPath.getxCounterGetPage);
            },),
          ],
        ),
      ),
    );
  }
}
