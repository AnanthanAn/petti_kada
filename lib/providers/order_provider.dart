import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petti_kada/helpers/firebase_helper.dart';
import 'package:petti_kada/models/cart.dart';
import 'package:petti_kada/models/order.dart';
import 'package:petti_kada/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class OrderProvider with ChangeNotifier {
  List<Order> _items = [];

  List<Order> get items {
    return [..._items];
  }

  Future<void> placeOrder(double totalAmount, List<Cart> products) async {
    var userId = await FirebaseHelper.getUserId();
    print(_items);
    await Firestore.instance.collection('orders').document().setData({
      'userId': userId,
      'totalAmount': totalAmount,
      'timestamp': DateTime.now().toString(),
      'products': products
          .map((e) => {
                'title': e.title,
                'id': e.id,
                'quantity': e.quantity,
                'price': e.price
              })
          .toList()
    });

  }

  Future<void> fetchOrdersForUser() async {
    _items.clear();
    var uid = await FirebaseHelper.getUserId();
    var orders = await Firestore.instance
        .collection('orders')
        .where('userId', isEqualTo: uid)
        .getDocuments();
    orders.documents.forEach((element) {
      var orderId = element.documentID;
      _items.add(
        Order(
          products: element.data['products'],
          totalAmount: element.data['totalAmount'],
          timestamp: element.data['timestamp'],
          orderId: orderId
        ),
      );
      print(
        element.data['products'],
      );
    });
    notifyListeners();
  }
}
