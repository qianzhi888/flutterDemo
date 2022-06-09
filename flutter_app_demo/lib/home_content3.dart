import 'package:flutter/material.dart';

class MyDemoApp3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("flutterDemo"),
        ),
        body: HomeContent5(),
      ),
      theme: ThemeData(primarySwatch: Colors.red),
    );
  }
}

///在listView列表中，如果需要限制列表的宽高，需要在外边包一层容器，不然宽高默认是铺满的
///还有就是如果在水平列表中，listView中的item可以不设置高度，默认铺满，
///在垂直列表中 item可以不设置宽度，默认铺满
class HomeContent5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: ListView(
        ///设置列表方向
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            width: 180,
            height: 180,
            color: Colors.blue,
          ),
          Container(
            width: 180,
            height: 180,
            color: Colors.red,
            child: ListView(
              children: <Widget>[
                Image.network("https://lmg.jj20.com/up/allimg/1114/113020142315/201130142315-1-1200.jpg"),
                Text("我是文本")
              ],
            ),
          ),
          Container(
            width: 180,
            height: 180,
            color: Colors.white10,
          ),
          Container(
            width: 180,
            height: 180,
            color: Colors.amberAccent,
          ),
        ],
      ),
    );
  }
}

class HomeContent4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: <Widget>[
        Image.network(
            "https://lmg.jj20.com/up/allimg/1114/113020142315/201130142315-1-1200.jpg"),
        Container(
          height: 20,
          margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
          //padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
          child: Text(
            "我是标题",
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
        Image.network(
            "https://lmg.jj20.com/up/allimg/1114/113020142315/201130142315-1-1200.jpg"),
        Image.network(
            "https://lmg.jj20.com/up/allimg/1114/113020142315/201130142315-1-1200.jpg"),
        Image.network(
            "https://lmg.jj20.com/up/allimg/1114/113020142315/201130142315-1-1200.jpg"),
        Image.network(
            "https://lmg.jj20.com/up/allimg/1114/113020142315/201130142315-1-1200.jpg"),
        Image.network(
            "https://lmg.jj20.com/up/allimg/1114/113020142315/201130142315-1-1200.jpg"),
        Image.network(
            "https://lmg.jj20.com/up/allimg/1114/113020142315/201130142315-1-1200.jpg"),
        Image.network(
            "https://lmg.jj20.com/up/allimg/1114/113020142315/201130142315-1-1200.jpg"),
      ],
    );
  }
}

///图文列表
class HomeContent3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: <Widget>[
        ListTile(
          ///设置图标
          leading: Image.network(
              "https://lmg.jj20.com/up/allimg/1114/113020142315/201130142315-1-1200.jpg"),
          title: Text(
            "一级标题",
            style: TextStyle(fontSize: 18, color: Colors.blue),
          ),
          subtitle: Text("二级标题"),
          trailing: Icon(
            Icons.home,
            color: Colors.blue,
            size: 50,
          ),
        ),
      ],
    );
  }
}
