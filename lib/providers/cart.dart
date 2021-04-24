import 'package:declutter_project/models/products.dart';
import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final int price;
  final List <Product> imageUrl;

  CartItem({
    this.imageUrl,
    this.id,
    this.price,
    this.quantity,
    this.title,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items =
      {}; //make sire this is an empty map else it will be called on null.

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  int get totalAmount {
    var total = 0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  // get existCart {
  //   if (_items.isEmpty) {
  //     print('Cart is empty');
  //   }
  // }

  void addItem(String productId, int price, String title) {
    //first check whether we already have the item in the cart
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingCartItem) => CartItem(
                id: existingCartItem.id,
                title: existingCartItem.title,
                price: existingCartItem.price,
                quantity: existingCartItem.quantity,
              ));
    } else {
      _items.putIfAbsent(productId, () {
        return CartItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: 1,
        );
      });
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void ClearCart() {
    _items.clear();
    notifyListeners();
  }
}
