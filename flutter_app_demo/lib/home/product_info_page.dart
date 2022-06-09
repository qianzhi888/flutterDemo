import 'package:flutter/material.dart';

class ProductInfopage extends StatefulWidget {
  Map? arguments;

  ProductInfopage({this.arguments});

  @override
  _ProductInfopageState createState() =>
      _ProductInfopageState(arguments: arguments);
}

class _ProductInfopageState extends State<ProductInfopage> {
  Map? arguments;

  _ProductInfopageState({this.arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("商品详情"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        width: double.infinity,
        height: double.infinity,
        child: Text(
            "商品名称：${arguments != null ? arguments!["productName"] : "暂时没有"}   商品id：${arguments != null ? arguments!["productId"] : 0}"),
      ),
    );
  }
}
