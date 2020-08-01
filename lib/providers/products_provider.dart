import 'package:flutter/material.dart';
import 'package:petti_kada/models/product.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> _items = [
    //Dummy Data
    Product(
        id: '1',
        title: 'Vegitables',
        desc: 'Good Quality & fresh vegitables',
        imageURL:
            'https://www.healthline.com/hlcmsresource/images/AN_images/fruits-and-vegetables-thumb.jpg',
        price: 100),
    Product(
        id: '2',
        title: 'Rice',
        desc: 'Good Quality & fresh vegitables',
        imageURL:
        'https://www.onceuponachef.com/images/2013/12/basmati-rice-1200x912.jpg',
        price: 60),
  ];

  List<Product> get items {
    return [..._items];
  }

  Product getProductById(String pId) {
   return _items.firstWhere((element) => element.id == pId);
  }
}
