import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class CartProvider with ChangeNotifier{
  List _cartList = [];

  int get cartNum => _cartList.length;

  List get cartList => _cartList;

  addData(value){
    _cartList.add(value);
    notifyListeners();
  }

  removeData(value){
    _cartList.remove(value);
    notifyListeners();
  }
}