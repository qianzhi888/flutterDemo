import 'package:flutter/material.dart';
import 'package:flutter_app_demo/home/common/router_path.dart';

///设置页面
class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Text(
              "命名路由跳转",
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, RouterPath.loginPage,
                      arguments: {"user_name": 1001, "password": "111111"});
                },
                child: Text("跳转到登录页面")),
            ElevatedButton(onPressed: () {
              Navigator.pushNamed(context, RouterPath.registerPage);
            }, child: Text("跳转到注册页面"))
          ],
        ),
      ),
    );
  }
}
