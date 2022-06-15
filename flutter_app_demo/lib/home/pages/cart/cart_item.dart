import 'package:flutter/material.dart';
import 'package:flutter_app_demo/home/common/theme_colors.dart';
import 'package:flutter_app_demo/home/state/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    return cartProvider.cartList.length > 0
        ? Column(
            children: cartProvider.cartList
                .map((e) => ListTile(
              trailing: InkWell(
                onTap: (){
                  cartProvider.removeData(e);
                },
                child: Icon(Icons.remove),
              ),
              shape: BorderDirectional(bottom: BorderSide(color: ThemeColors.color999999,width: 1)),
                      title: Text("$e"),
                    ))
                .toList(),
          )
        : const Text(
            "暂无数据",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 38),
          );
  }
}
