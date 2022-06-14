import 'package:flutter/material.dart';
import 'package:flutter_app_demo/res/list_data_bean.dart';

/**
 * 网格列表 gridView
 */

class MyDemoApp5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("flutterDemo"),
        ),
        body: HomeContent1(),
      ),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

class HomeContent1 extends StatelessWidget {
  List<Widget> getListData() {
    var list = listDatas.map((value) {
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            border: Border.all(color: Colors.greenAccent, width: 2)),
        child: Column(
          children: <Widget>[
            Image.network(value["imageUrl"]),

            ///边距盒子
            SizedBox(height: 10),
            Text(
              value["title"],
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blue, fontSize: 18),
            ),
          ],
        ),
      );
    });

    return list.toList();
  }

  Container getListData2(context, index) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: Colors.greenAccent, width: 2)),
      child: Column(
        children: <Widget>[
          Image.network(listDatas[index]["imageUrl"]),

          ///边距盒子
          SizedBox(height: 10),
          Text(
            listDatas[index]["title"],
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.blue, fontSize: 18),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    /*return GridView.count(
      padding: EdgeInsets.all(16),

      /// 调整宽高比
      //childAspectRatio: 0.7,

      ///item 水平边距
      crossAxisSpacing: 20,

      ///item 垂直边距
      mainAxisSpacing: 10,

      ///控制网格布局列数
      crossAxisCount: 2,
      children: getListData(),
    );*/

    return GridView.builder(
      padding: EdgeInsets.all(16),
      itemCount: listDatas.length,
      itemBuilder: getListData2,

      ///注意 网格设置
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

          ///item 水平边距
          crossAxisSpacing: 10,

          ///item 垂直边距
          mainAxisSpacing: 10,

          ///网格列数
          crossAxisCount: 2),
    );
  }
}
