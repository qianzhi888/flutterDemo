import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

///Future练习

class FutureTest {
  Future<String> testFuture() {
    _test = "1";
    debugPrint("_test = $_test");
    return Future.value("成功");
    // return Future.error("失败");
  }

  ///测试Future的使用
  testUseFuture() async {
    //testFuture().then((value) => {print(value)});

    // print(DateTime.now());
    // int result = await Future.delayed(Duration(milliseconds: 2000), () {
    //   return Future.value(123);
    // });
    //
    // print('测试future：$result - ${DateTime.now()}');

    var random = Random();
    Future.delayed(Duration(seconds: 3), () {
      if (random.nextBool()) {
        return 100;
      } else {
        throw "boom!";
      }
    })
        .then((value) => {
              //成功回调
              debugPrint("then：$value")
            })
        .catchError((error) {
          //失败回调
          debugPrint("error：$error");
        })
        .timeout(Duration(seconds: 3)) //设置超时时间(比如请求可能比较耗时，可以给定一个超时时间，如果在这个时间内还不成功，则抛出异常)
        .whenComplete(() => () {
              //结束时调用
              debugPrint("whenComplete");
            });
  }

  ///测试FutureBuilder的使用
  testUseFutureBuilder() async {
    FutureBuilder<String>(
      future: testFuture(),
      builder: (context, snapshot) {
        snapshot.connectionState.name;

        var a = snapshot.requireData;
        debugPrint("FutureBuilder：builder  $a");
        return Text("测试");
      },
    );
  }

  var _test;
}

void main() {
  var futureTest = FutureTest();
  futureTest.testUseFuture();

  futureTest.testUseFutureBuilder();
}
