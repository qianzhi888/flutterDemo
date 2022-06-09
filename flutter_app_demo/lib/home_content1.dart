import 'package:flutter/material.dart';
class MyDemoApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        ///设置标题栏
        appBar: AppBar(
          title: Text("flutterDemo"),
        ),

        ///设置内容
        body: HomeContent1(),
      ),

      ///设置主题
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}

class HomeContent1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
        child: Container(
          height: 300.0,
          width: 300.0,

          ///设置内边距 all 设置四个边距
          // padding: EdgeInsets.all(20.0),
          ///单独设置各个边的边距
          padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),

          ///设置组件位移
          //transform: Matrix4.translationValues(100.0, 0.0, 0.0),
          ///设置旋转
          //transform: Matrix4.rotationZ(0.3),
          //transform: Matrix4.skew(10.0, 10.0),

          ///设置子组件相对于父组件的位置
          alignment:Alignment.bottomRight,


          ///装饰容器组件
          decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.all(Radius.circular(12.0)),

              ///设置背景色
              ///设置边框
              border: Border.all(width: 10.0, color: Colors.blue)),

          child: const Text(
              '你好flutter',
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,

              ///文字过长时的展示模式
              maxLines: 2,
              textScaleFactor: 1.2,

              ///文字放大倍数
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.red,

                  ///设置文字中间有条线
                  decoration: TextDecoration.lineThrough,
                  decorationColor: Colors.black,

                  ///设置中间线的样式
                  decorationStyle: TextDecorationStyle.dashed,

                  ///设置文字倾斜
                  fontStyle: FontStyle.italic,

                  ///设置文字间隔
                  letterSpacing: 5.0,

                  ///文字加粗
                  fontWeight: FontWeight.w800

                // color: Color.fromARGB(a, r, g, b)
              ),
              textDirection: TextDirection.ltr),
        ));
  }
}
