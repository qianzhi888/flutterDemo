import 'package:flutter/material.dart';
import 'package:flutter_app_demo/res/list_data_bean.dart';
///card 卡片组件
///AspectRatio 比例组件 可用于设置图片比例
class MyDemoApp8 extends StatelessWidget {
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

class HomeContent3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listDatas.length, itemBuilder: getItemView);
  }

  Widget getItemView(context, int index) {
    return Card(
      margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
      elevation: 10,
      shadowColor: Colors.black,
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: <Widget>[
          ///第一种
         /* AspectRatio(
            aspectRatio: 20/9,
            child: Image.asset(
              'images/ic_test_image.jpeg',
              fit: BoxFit.cover,
            ),
          ),

          ListTile(
            // leading: CircleAvatar(
            //   backgroundImage: NetworkImage(listDatas[index]["imageUrl"]),
            // ),
            leading: ClipOval(
              child: Image.asset(
                'images/ic_test_image.jpeg',
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(listDatas[index]["title"]),
            subtitle: Text(listDatas[index]["author"],maxLines: 2,overflow: TextOverflow.ellipsis,),
          )*/

          ///第二种
          Container(
            width: double.infinity,
            height: 200,
            //child: Image.network(listDatas[index]["imageUrl"]),
            child: Image.asset(
              'images/ic_test_image.jpeg',
              fit: BoxFit.cover,
              height: 200,
            ),
          ),

          Container(
            width: double.infinity,
            color: Colors.blue,
            child: Row(
              children: <Widget>[
                ClipOval(
                  child: Image.asset(
                    'images/ic_test_image.jpeg',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  children: <Widget>[
                    Text(listDatas[index]['title']),
                    ///在Row水平组件中的子组件 内容过长超出屏幕宽度会报错
                    //Text(listDatas[index]['author'],maxLines: 1,overflow: TextOverflow.ellipsis,)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class HomeContent2 extends StatelessWidget {
  Widget getItemView(context, int index) {
    return Card(
      margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
      elevation: 10,
      shadowColor: Colors.blue,
      child: Column(
        children: <Widget>[
          Image.asset('images/ic_test_image.jpeg'),
          ListTile(
            title: Text(
              listDatas[index]["title"],
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            subtitle: Text(listDatas[index]["author"]),
          ),
          ListTile(
            title: Text("我是详细内容红红火火恍恍惚惚或或"),
          ),

          ///在Row水平组件中的子组件 内容过长超出屏幕宽度会报错
          // Row(
          //   children: <Widget>[
          //     Text("我是详细内容红红火火恍恍惚惚或或v我是详细内容红红火火恍恍惚惚或或我是详细内容红红火火恍恍惚惚或或我是详细内容红红火火恍恍惚惚或或我是详细内容红红火火恍恍惚惚或或我是详细内容红红火火恍恍惚惚或或我是详细内容红红火火恍恍惚惚或或")
          //   ],
          // )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listDatas.length, itemBuilder: getItemView);
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      ///设置宽高比
      aspectRatio: 3.0 / 1.0,
      child: Container(
        color: Colors.red,
      ),
    );
  }
}
