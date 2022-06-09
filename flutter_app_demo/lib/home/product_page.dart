import 'package:flutter/material.dart';
import 'package:flutter_app_demo/home/common/router_path.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("商品页面"),
      ),
      body: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, RouterPath.productInfoPage,arguments: {
                "productId":100,
                "productName": "MacBookPro m1"
              });
            },
            child: Text("跳转到商品详情页面"),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue)),
          ),
        ],
      ),
    );
  }
}
