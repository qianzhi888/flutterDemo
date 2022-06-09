import 'package:flutter/material.dart';
import 'package:flutter_app_demo/home/common/common_constant.dart';
import 'package:flutter_app_demo/home/common/router_path.dart';
import 'package:flutter_app_demo/home/pages/tabs.dart';

///pushReplacementNamed 替换路由的使用，以及普通路由如何一下子返回根页面
class RegisterPage extends StatefulWidget {
  Map? arguments;

  RegisterPage({this.arguments});

  @override
  _RegisterPageState createState() => _RegisterPageState(arguments: arguments);
}

class _RegisterPageState extends State<RegisterPage> {
  Map? arguments;

  _RegisterPageState({this.arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("注册"),
        ),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Text("注册页面第一步"),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, RouterPath.registerSecondPage);

                      ///替换路由，比如从 A页面跳转到B页面，再从B页面跳转到C页面，这个时候返回想直接返回到A页面的时候使用替换路由
                      ///相当于跳转过去的页面把当前页面给替换掉了
                      //Navigator.pushReplacementNamed(context, RouterPath.registerSecondPage);
                    },
                    child: Text("下一步")),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
            color: Colors.white));
  }
}

class RegisterPageSecond extends StatefulWidget {
  final arguments;

  RegisterPageSecond({this.arguments});

  @override
  _RegisterPageSecondState createState() =>
      _RegisterPageSecondState(arguments: arguments);
}

class _RegisterPageSecondState extends State<RegisterPageSecond> {
  final arguments;

  _RegisterPageSecondState({this.arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("注册"),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Text("注册第二步"),
              ElevatedButton(
                  onPressed: () {
                    //Navigator.pushReplacementNamed(context, RouterPath.registerThirdPage);
                    Navigator.pushNamed(context, RouterPath.registerThirdPage);
                  },
                  child: Text("下一步"))
            ],
          ),
        ));
  }
}

class RegisterThirdPage extends StatefulWidget {
  @override
  _RegisterThirdPageState createState() => _RegisterThirdPageState();
}

class _RegisterThirdPageState extends State<RegisterThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("注册"),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Text('第三步'),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    // Navigator.of(context).pop();

                    ///返回根页面
                    Navigator.of(context).pushAndRemoveUntil(
                        new MaterialPageRoute(builder: (context) => TabsPage(pageIndex: CommonConstant.settingsPageIndex,)),
                        (route) => route == null);
                  },
                  child: Text("确定"))
            ],
          ),
        ));
  }
}
