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
    Product(
        id: '3',
        title: 'Chips',
        desc: 'Good Quality & fresh Chips',
        imageURL:
        'https://firebasestorage.googleapis.com/v0/b/petti-kada.appspot.com/o/LRM_EXPORT_20200617_215936-03-01.jpeg?alt=media&token=77e6a5e0-452d-4935-8d1f-21aa1e1e3156',
        price: 20),
  ];

  List<Product> get items {
    return [..._items];
  }

  Product getProductById(String pId) {
   return _items.firstWhere((element) => element.id == pId);
  }
}
