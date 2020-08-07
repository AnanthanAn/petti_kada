import 'package:flutter/foundation.dart';
import 'package:petti_kada/models/cart.dart';

class Order {
  final double totalAmount;
  final List<Cart> products;
  final String timestamp;

  Order(
      {@required this.products,
      @required this.totalAmount,
      @required this.timestamp});
}
