import 'package:flutter/material.dart';
import 'package:flutter_app_demo/home/common/router_path.dart';
import 'package:flutter_app_demo/home/search_page.dart';
///首页
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Wrap(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          ElevatedButton(
            onPressed: () {
              //跳转到搜索
              //Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchPage()));

              //使用命名路由进行跳转
              Navigator.pushNamed(context, RouterPath.searchPage);
            },
            child: Text("跳转搜索"),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue)),
          ),
          SizedBox(
            width: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, RouterPath.productPage);
            },
            child: Text("跳转到商品页面"),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red)),
          ),

          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, RouterPath.appbarDemoPage);
            },
            child: Text("跳转到自定义appbar"),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green)),
          ),
          SizedBox(width: 20,),
          ElevatedButton(onPressed: (){
            Navigator.pushNamed(context, RouterPath.buttonDemoPage);
          },child: Text("跳转到按钮演示页面"),),

          SizedBox(width: 20,),
          ElevatedButton(onPressed: (){
            Navigator.pushNamed(context, RouterPath.askForLeavePage);
          }, child: Text("跳转到请假页面")),

          SizedBox(width: 20,),
          ElevatedButton(onPressed: (){
            Navigator.pushNamed(context, RouterPath.textFieldPage);
          }, child: Text("跳转到常用表单页面")),

          SizedBox(width: 20,),
          ElevatedButton(onPressed: (){
            Navigator.pushNamed(context, RouterPath.dateWidgetPage);
          }, child: Text("跳转到日期组件页面")),

          SizedBox(width: 20,),
          ElevatedButton(onPressed: (){
            Navigator.pushNamed(context, RouterPath.bannerPage);
          }, child: Text("跳转到轮播图组件页面")),

          SizedBox(width: 20,),
          ElevatedButton(onPressed: (){
            Navigator.pushNamed(context, RouterPath.dialogPage);
          }, child: Text("跳转到Dialog组件页面")),
        ],
      ),
    );
  }
}
