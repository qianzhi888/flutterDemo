
import 'package:flutter/material.dart';

class BannerPage extends StatefulWidget {
  @override
  _BannerPageState createState() => _BannerPageState();
}

class _BannerPageState extends State<BannerPage> {
  @override
  Widget build(BuildContext context) {
    ///通过mediaQuery适配全面屏、状态栏的适配
    final EdgeInsets padding = MediaQuery.of(context).padding;

    ///SafeArea 安全区，可以实现全面屏、状态栏的适配
    return SafeArea(
      child: Container(
        // color: Colors.white,
        decoration: BoxDecoration(color: Colors.white),
        // padding: EdgeInsets.fromLTRB(0, padding.top, 0, padding.bottom),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("顶部",style: TextStyle(fontSize: 20),),
            Text("底部"),
          ],
        ),
      ),
    );
  }
}
