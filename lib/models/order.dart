import 'package:flutter/foundation.dart';
import 'package:petti_kada/models/cart.dart';

class Order {
  final String orderId;
  final double totalAmount;
  final List<dynamic> products;
  final String timestamp;

  Order(
      {@required this.products,
      @required this.orderId,
      @required this.totalAmount,
      @required this.timestamp});
}
