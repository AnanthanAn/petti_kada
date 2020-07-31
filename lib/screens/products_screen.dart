import 'package:flutter/material.dart';
import 'package:petti_kada/constants/constants.dart';
import 'package:petti_kada/models/product.dart';
import 'package:petti_kada/providers/products_provider.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  static String routeName = '/products-screen';

  @override
  Widget build(BuildContext context) {
    List<Product> products = Provider.of<ProductsProvider>(context).items;
    return Scaffold(
      appBar: setDefaultAppBar(),
      body: ListView.builder(
        itemBuilder: (context, idx) => ListTile(title: Text(products[idx].title),),
        itemCount: products.length,
      ),
    );
  }
}
