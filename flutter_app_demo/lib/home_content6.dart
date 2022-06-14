
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/res/list_data_bean.dart';
///水平组件
///垂直组件
///权重组件

class MyDemoApp6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text("flutterDemo"),
      ),
      body: TestWidget(),
    ));
  }
}

class TestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: <Widget>[
          TopContainer(),
          SizedBox(
            height: 10,
          ),
          BottomContainer(),
        ],
      ),
    );
  }
}

class TopContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      color: Colors.black,
      //margin: EdgeInsets.all(10),
    );
  }
}

class BottomContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Row(
        children: <Widget>[
          Expanded(
              flex: 2,
              child: Container(
                height: 180,
                child: Image.network(
                  "https://lmg.jj20.com/up/allimg/1114/113020142315/201130142315-1-1200.jpg",
                  fit: BoxFit.cover,
                ),
              )),
          SizedBox(
            width: 10,
          ),
          Expanded(
              flex: 1,
              child: Container(
                height: 180,
                child: Column(
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Container(
                          child: Image.network(
                            "https://lmg.jj20.com/up/allimg/1114/113020142315/201130142315-1-1200.jpg",
                            fit: BoxFit.cover,
                          ),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                        flex: 1,
                        child: Container(
                          child: Image.network(
                            "https://lmg.jj20.com/up/allimg/1114/113020142315/201130142315-1-1200.jpg",
                            fit: BoxFit.cover,
                          ),
                        )),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

class ExpandedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ///expanded组件相当于LinearLayout 可以设置权重
        Expanded(

            ///flex权重
            flex: 2,
            child: IconContainar(
              Icons.home,
              color: Colors.blue,
              bgColor: Colors.red,
            )),
        Expanded(
            //flex: 2,
            child: IconContainar(
          Icons.add,
          color: Colors.yellow,
          bgColor: Colors.green,
        )),
        Expanded(
            //flex: 1,
            child: IconContainar(
          Icons.settings,
          color: Colors.deepPurple,
          bgColor: Colors.tealAccent,
        )),
      ],
    );
  }
}

///垂直组件
class ColumnWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          IconContainar(
            Icons.home,
            color: Colors.greenAccent,
          ),
          IconContainar(
            Icons.settings,
            color: Colors.greenAccent,
          ),
          IconContainar(
            Icons.add,
            color: Colors.greenAccent,
          ),
        ],
      ),
    );
  }
}

///水平组件
class RowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.blue,
      margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: Row(
        ///调整水平方向边距
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        ///调整垂直方向边距
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          IconContainar(
            Icons.home,
            color: Colors.greenAccent,
          ),
          IconContainar(
            Icons.settings,
            color: Colors.greenAccent,
          ),
          IconContainar(
            Icons.add,
            color: Colors.greenAccent,
          ),
        ],
      ),
    );
  }
}

class IconContainar extends StatelessWidget {
  ///定义可空类型变量
  double? size;
  Color? color;
  IconData icon;
  Color? bgColor;

  IconContainar(this.icon,
      {this.color = Colors.red, this.size = 32.0, this.bgColor = Colors.red});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: bgColor,
      child: Center(
        child: Icon(
          icon,
          size: size,
          color: color,
        ),
      ),
    );
  }
}

class HomeContent1 extends StatelessWidget {
  Container getListData2(context, index) {
    ConstrainedBox(
      constraints: const BoxConstraints.expand(
          width: double.infinity, height: double.infinity),
      child: Container(),
    );
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
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.7,
        children: listDatas
            .map((value) => Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                  //margin: EdgeInsets.fromLTRB(16, 16, 0, 0),
                  child: Image.network(
                    value["imageUrl"],
                    fit: BoxFit.cover,
                  ),
                ))
            .toList(),
      ),
    );
  }
}
