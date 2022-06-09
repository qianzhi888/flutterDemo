import 'package:flutter/material.dart';
import 'package:flutter_app_demo/home/common/common_constant.dart';
import 'package:flutter_app_demo/home_content1.dart';
import 'package:flutter_app_demo/home_content2.dart';
import 'package:flutter_app_demo/home_content3.dart';
import 'package:flutter_app_demo/home_content4.dart';
import 'package:flutter_app_demo/home_content5.dart';
import 'package:flutter_app_demo/res/list_data_bean.dart';
import 'package:flutter_app_demo/home_content6.dart';
import 'package:flutter_app_demo/home_content7.dart';
import 'package:flutter_app_demo/home_content8.dart';
import 'package:flutter_app_demo/home_content9.dart';
import 'package:flutter_app_demo/home_content10.dart';
import 'package:flutter_app_demo/main_app_page.dart';

class Result<T> {
  late T data;
  late final String name = "";
  late String sex = "";

  void a() {
    sex = "女";
    //name = "张三";
  }
}

void main() {
  //testFunction(name: "张三",sex: null);
  // testFuncation1("", 1, "");

  /*var demo = TestClass(name: "靳前志",age: 18);
  demo.printDesc();*/

  /*var testClass2 = TestClass2();
  testClass2.log();*/
  runApp(MyDemoApp10());
}

class TestClass2{
  final pageIndex;
  TestClass2({this.pageIndex = CommonConstant.homePageIndex}){

  }

  void log(){
    print(this.pageIndex);
  }
}

class TestClass {
  String? name;
  String? sex;

  late int age;

  TestClass({this.name = "张三", this.sex = "女", required this.age});

  void printDesc() {
    print("name = $name    age = $age    sex = $sex");
  }
}

///执行入口
/// 类似于kotlin中的可选参数
/// 无人性推断
/// dynamic 特殊类型
/// Object 任意类型 在可选参数中如果指定了此类型，则必须声明为必传参数:required Object name
/// 但可以  Object? name 指定为可空，即可实现可选参数的目的
void testFunction({dynamic name, int? age = 18, required String? sex}) {
  print("name = $name    age = $age    sex = $sex");
  //testFuncatoin2(name as int);
}

void testFuncation1(name, int age, String sex) {
  print("name = $name    age = $age    sex = $sex");
}

void testFuncatoin2(int age) {
  print("testFuncatoin2 = $age");
}
