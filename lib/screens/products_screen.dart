import 'package:flutter/material.dart';
import 'package:petti_kada/constants/constants.dart';
import 'package:petti_kada/models/product.dart';
import 'package:petti_kada/providers/products_provider.dart';
import 'package:petti_kada/widgets/products_item.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  static String routeName = '/products-screen';

  @override
  Widget build(BuildContext context) {
    List<Product> _products = Provider.of<ProductsProvider>(context).items;
    return Scaffold(
      appBar: setDefaultAppBar(),
      body: ListView.builder(
        itemBuilder: (context, idx) => ProductItem(
          id: _products[idx].id,
          title: _products[idx].title,
          imageURL: _products[idx].imageURL,
          price: _products[idx].price,
        ),
        itemCount: _products.length,
      ),
    );
  }
}
