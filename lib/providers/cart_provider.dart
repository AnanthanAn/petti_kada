import 'package:flutter/material.dart';
import 'package:petti_kada/models/cart.dart';

class CartProvider with ChangeNotifier {
  Map<String, Cart> _items = {};

  Map<String, Cart> get items {
    return {..._items};
  }

  void addItemToCart(String prodId, String title, double price) {
    if (_items.containsKey(prodId)) {
      //checking whether product already in cart
      _items.update(
          //updating quantity by 1 if product exists
          prodId,
          (value) => Cart(
              id: value.id,
              title: value.title,
              quantity: value.quantity + 1,
              price: value.price));
    } else {
      _items.putIfAbsent(
          // if product not present in cart adding it
          prodId,
          () => Cart(
              id: DateTime.now().toString(),
              title: title,
              quantity: 1,
              price: price));
    }
    notifyListeners();
  }

  double get totalAmount {
    //calculates total cart amount
    double total = 0;
    _items.forEach((key, value) {
      total += (value.quantity * value.price);
    });
    return total;
  }
}
