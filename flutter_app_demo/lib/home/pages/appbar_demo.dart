import 'package:flutter/material.dart';
import 'package:flutter_app_demo/res/list_data_bean.dart';
///自定义导航以及tab切换
class AppBarDemoPage extends StatelessWidget {
  Widget getItemView(context, index) {
    return Container(
      child: Text("我是第${index + 1}条，我叫:${listDatas[index]["title"]}"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        ///顶部tab切换数量  需要与TabBar中的数量对应
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            ///标题居中
            centerTitle: true,
            title: Text("appbar"),
            backgroundColor: Colors.green,

            ///设置左边按钮,不设置的话默认是返回
            // leading: IconButton(
            //   onPressed: () {},
            //   icon: Icon(Icons.menu),
            // ),

            ///设置右边按钮，可设置多个
            // actions: <Widget>[
            //   IconButton(
            //     onPressed: () {},
            //     icon: Icon(Icons.search),
            //   ),
            //   IconButton(
            //     onPressed: () {},
            //     icon: Icon(Icons.settings),
            //   )
            // ],

            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  text: "热门",
                ),
                Tab(
                  text: "推荐",
                ),
                Tab(
                  text: "品牌",
                ),
              ],
            ),
          ),

          ///TabBarView中的子组件需要与TabBar中的数量对应
          body: TabBarView(
            children: <Widget>[
              ListView.builder(
                  itemCount: listDatas.length, itemBuilder: getItemView),
              Container(child: Text("推荐"),),
              Container(child: Text("品牌"),)
            ],
          ),
        ),
      ),
    );
  }
}
