import 'package:flutter/material.dart';
import 'package:flutter_app_demo/home/pages/cart/cart_item.dart';
import 'package:flutter_app_demo/home/pages/cart/cart_num.dart';

import 'package:provider/provider.dart';

import '../../state/provider/cart_provider.dart';

class CartPage extends StatefulWidget {

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {

    var cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("购物车"),),
        body: Scrollbar(
          thumbVisibility: true,
          trackVisibility: true,
          thickness: 8,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Center(
                  child: Text("统计数量：${cartProvider.cartNum}",style: TextStyle(fontSize: 20),),
                ),
                Divider(),
                CartItem(),
                Divider(height: 40,),
                CartNum(),
              ],
            ),
          ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          cartProvider.addData("哈哈${cartProvider.cartNum}");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
