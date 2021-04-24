import 'package:flutter/material.dart';
import './cart.dart';

class OrderItem {
  final String id;
  final int amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    @required this.id,
    @required this.products,
    @required this.amount,
    @required this.dateTime,
  });
}

class Orders with ChangeNotifier {
//create an empty orderItem as a list of items
  List<OrderItem> _order = [];

  // create a getter as a copy

  List<OrderItem> get order {
    return [..._order];
  }

  //create a method that handles the adding order
  void addOrder(List<CartItem> cartProduct, int total) {
    order.insert(
        0,
        OrderItem(
            id: DateTime.now().toString(),
            products: cartProduct,
            amount: total,
            dateTime: DateTime.now()));

    notifyListeners();
  }
}
