import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petti_kada/models/product.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> _items = [];

  List<Product> get items {
    return [..._items];
  }

  Product getProductById(String pId) {
    return _items.firstWhere((element) => element.id == pId);
  }

  Future<void> fetchAndSetProducts() async {
    _items.clear();
    var snap = await Firestore.instance.collection('products').getDocuments();
    snap.documents.forEach((element) {
      _items.add(Product(
          id: element.data['id'],
          title: element.data['title'],
          desc: element.data['desc'],
          imageURL: element.data['imageURL'],
          price: double.parse(element.data['price'].toString())));
    });
    notifyListeners();
  }
}
