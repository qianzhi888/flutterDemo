import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app_demo/home/common/theme_colors.dart';
///自定义dialog
class MyDialog extends Dialog {
  var title;
  var content;
  String? nullSecurity;
  ///child: Text(nullSecurity??"123"),为空是可以这么引用

  ///可选参数中的必填参数
  MyDialog({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    _showTimer(context);

    return Material(
      ///设置透明度
      type: MaterialType.transparency,
      child: Center(
          child: Container(
        width: 200,
        height: 200,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(title),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        ///关闭dialog
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.close),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 1,
              color: ThemeColors.color999999,
            ),
            Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  content,
                  textAlign: TextAlign.left,
                ),
                width: double.infinity)
          ],
        ),
      )),
    );
  }

  ///定时器
  _showTimer(context) {
    ///回调多次的定时器: 根据配置得时间单位，每1单位回调一次
    // var timer = Timer.periodic(Duration(milliseconds: 3000), (t) {
    //   Navigator.pop(context);
    //   print("关闭");
    //   t.cancel(); //取消定时器  也可以用timer.cancel()来取消
    // });

    ///回调只需要一次: 等待给定时间后回调
    Timer(Duration(milliseconds: 3000), () {
      Navigator.pop(context);
      print("关闭");
    });
  }
}
