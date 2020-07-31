import 'package:flutter/material.dart';

class Product{
  final String id;
  final String title;
  final String desc;
  final String imageURL;
  final double price;

  Product({
    @required this.id,
    @required this.title,
    @required this.desc,
    @required this.imageURL,
    @required this.price,
});
}