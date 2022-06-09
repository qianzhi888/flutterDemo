import 'package:flutter/material.dart';
import 'package:flutter_app_demo/home/common/router_path.dart';
import 'package:flutter_app_demo/home/form_page.dart';

///分类页面
class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,

          ///appbar中的TabBar
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ///权重组件
              Expanded(
                  child: TabBar(
                ///设置为true 如果有多个tab 则可以滑动
                isScrollable: false,
                indicatorColor: Colors.red,
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.label,
                labelStyle:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                unselectedLabelStyle: TextStyle(fontSize: 16),
                tabs: <Widget>[
                  Tab(
                    text: "热销",
                  ),
                  Tab(
                    text: "推荐",
                  )
                ],
              ))
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                      onPressed: () {
                        ///通过普通路由进行跳转并传值
                        //Navigator.of(context).push(MaterialPageRoute(builder: (context) => FormPage(str: "我是传的值")));

                        ///通过命名路由进行跳转并传值
                        Navigator.pushNamed(context, RouterPath.formPage,
                            arguments: {"userId": "888"});
                      },
                      child: Text("跳转表单页面并传值")),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, RouterPath.tabBarControllerPage);
                      },
                      child: Text("跳转到TabBarControllerPage")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
