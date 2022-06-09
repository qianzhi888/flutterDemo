import 'package:flutter/material.dart';
import 'package:flutter_app_demo/res/list_data_bean.dart';

class MyAppDemo4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("flutterDemo"),
        ),
        body: HomeContent2(),
      ),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

class HomeContent2 extends StatelessWidget {
  var list = <String>[];

  HomeContent2() {
    for (var i = 0; i < 20; i++) {
      list.add("我是第${i + 1}条数据");
    }
  }

  /*@override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: this.list.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              this.list[index],
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
          );
        });
  } */

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listDatas.length,

      // itemBuilder: (context, index) {
      //   return _getItemWidget(context,index);
      // }

      ///上边的可以写成这样的方式
      itemBuilder: _getItemWidget,
    );
  }

  ///自定义方法 可以把这步操作抽取出来
  Widget _getItemWidget(context, index) {
    return ListTile(
        title: Text(
      listDatas[index]["title"],
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 18),
    ));
  }
}

class HomeContent1 extends StatelessWidget {
  List<Widget> list = [];

  List<Widget> _getData() {
    var typeList = listDatas.map((value) {
      return ListTile(
        leading: Image.network(value["imageUrl"]),
        title: Text(value["title"]),
        subtitle: Text(value["author"]),
      );
    });
    return typeList.toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: this._getData());
  }
}
