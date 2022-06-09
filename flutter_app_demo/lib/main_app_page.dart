import 'package:flutter/material.dart';
import 'package:flutter_app_demo/home/common/router_path.dart';
import 'package:flutter_app_demo/home/pages/tabs.dart';
import 'package:flutter_app_demo/home/routes/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
///命名路由 需要在MaterialApp根组件中定义
class MyDemoApp10 extends StatefulWidget {
  @override
  HomeBottomTab createState() => HomeBottomTab();
}

class HomeBottomTab extends State<MyDemoApp10> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: TabsContent(),
      ///去掉app debug图片
      debugShowCheckedModeBanner: false,
      ///初始化的时候加载的路由  这里需要注意，初始化加载的路由配置路由时，如果配置了参数，初始化的时候传过去的值是null
      initialRoute: RouterPath.tabsPage,
      theme: ThemeData(primarySwatch: Colors.blue),

      ///汉化时间组件
      localizationsDelegates: const [
        //此处
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        //此处
        Locale('zh', 'CH'),
        Locale('en', 'US'),
      ],
      ///配置普通界面路由
      /*routes: {
        "/form":(context)=>FormPage(),
        "/search":(context)=>SearchPage(),
      },*/

      ///可以传值的路由
      onGenerateRoute: baseGernerateRoute,
    );
  }
}