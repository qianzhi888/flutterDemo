import 'package:flutter/material.dart';

class TabBarControllerPage extends StatefulWidget {
  @override
  _TabBarControllerPageState createState() => _TabBarControllerPageState();
}

///通过TabController实现tab切换
///with 可以多继承 或者多实现
class _TabBarControllerPageState extends State<TabBarControllerPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  

  ///初始化state组件时执行
  @override
  void initState() {
    super.initState();
    ///length tab切换的数量
    tabController = new TabController(length: 2, vsync: this);

    ///设置监听，可以监听当前滑动的状态
    tabController.addListener(() {
      print(tabController.index);
    });
  }

  @override
  void dispose(){
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("TabBarControllerPage"),
          bottom: TabBar(
            controller: this.tabController,
            tabs: <Widget>[
              Tab(
                text: "推荐",
              ),
              Tab(
                text: "热门",
              ),
            ],
          ),
        ),
        body: TabBarView(controller: this.tabController, children: <Widget>[
          Center(
            child: Text("推荐"),
          ),
          Center(
            child: Text("热门"),
          ),
        ]));
  }
}
