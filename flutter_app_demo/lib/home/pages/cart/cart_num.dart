import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../state/provider/cart_provider.dart';

class CartNum extends StatefulWidget {

  @override
  _CartNumState createState() => _CartNumState();
}

class _CartNumState extends State<CartNum> {
  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    return Column(
      children: <Widget>[
        Text("${cartProvider.cartNum}",style: TextStyle(fontSize: 20),)
      ],
    );
  }
}
