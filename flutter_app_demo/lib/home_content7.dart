import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_app_demo/res/list_data_bean.dart';

class MyAppDemo7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("flutterDemo"),
        ),
        body: TestDemoWidget(),
      ),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

///这里有一个问题 Positioned组件如何水平居中和垂直居中，在homeContent3里边实现了的方式，为什么在listView中实现不了
class TestDemoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listDatas.length,
      itemBuilder: getItemWidget,
    );
  }

  Widget getItemWidget(context, index) {
    String imageUrl = listDatas[index]["imageUrl"];
    String title = listDatas[index]["title"];
    String author = listDatas[index]["author"];

    Color color;
    if (index % 2 == 0) {
      color = Colors.red;
    } else {
      color = Colors.blue;
    }
    return Container(
      width: double.infinity,
      height: 180,
      color: color,
      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Stack(
        children: <Widget>[
          Positioned(
              child: Container(
            width: double.infinity,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          )),
          Positioned(
              left: 10,
              //right: 10,
              //top: 10,
              bottom: 10,
              child: Text(
                "$author----->$title",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.red,
                    backgroundColor: Colors.white),
              )),
        ],
      ),
    );
  }
}

///stack 和 Positioned 结合使用
class HomeContent3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      color: Colors.red,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 10,
            right: 10,
            top: 10,
            bottom: 10,
            child: Icon(
              Icons.home,
              size: 40,
              color: Colors.white,
            ),
          ),
          Positioned(
            right: 1,
            child: Icon(
              Icons.search,
              size: 30,
              color: Colors.green,
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Icon(
              Icons.settings,
              size: 60,
              color: Colors.blue,
            ),
          ),
          Positioned(
            top: 1,
            bottom: 1,
            child: Icon(
              Icons.access_alarms_outlined,
              size: 20,
              color: Colors.yellow,
            ),
          ),
        ],
      ),
    );
  }
}

///stack 和 align 结合使用
class HomeContent2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 400,
        color: Colors.red,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment(0, 0),
              child: Icon(
                Icons.home,
                size: 40,
                color: Colors.white,
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.search,
                size: 30,
                color: Colors.green,
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Icon(
                Icons.settings,
                size: 60,
                color: Colors.blue,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Icon(
                Icons.access_alarms_outlined,
                size: 20,
                color: Colors.yellow,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeContent1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      ///Stack组件，组件中的内容可以根据指定位置摆放
      child: Stack(
        //alignment: Alignment.topLeft,
        ///指定参数 范围为 -1 ~ 1  容器中心为 0,0
        //alignment: Alignment(0,0),
        children: <Widget>[
          Container(
            width: 300,
            height: 400,
            color: Colors.red,
          ),
          Text("我是一个文本"),
        ],
      ),
    );
  }
}
