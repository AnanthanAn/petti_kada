import 'package:flutter/material.dart';
import 'package:petti_kada/constants/constants.dart';
import 'package:petti_kada/models/product.dart';
import 'package:petti_kada/providers/products_provider.dart';
import 'package:petti_kada/widgets/products_item.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatefulWidget {
  static String routeName = '/products-screen';

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  var _isLoading = false;
  @override
  void initState() {
    _refreshPage(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Product> _products = Provider.of<ProductsProvider>(context).items;
    return Scaffold(
      appBar: setDefaultAppBar(context),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: () => _refreshPage(context),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemBuilder: (context, idx) => ProductItem(
                    id: _products[idx].id,
                    title: _products[idx].title,
                    imageURL: _products[idx].imageURL,
                    price: _products[idx].price,
                  ),
                  itemCount: _products.length,
                ),
              ),
            ),
    );
  }

  Future<void> _refreshPage(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });
    var result = await Provider.of<ProductsProvider>(context, listen: false)
        .fetchAndSetProducts();
    setState(() {
      _isLoading = false;
    });
    return result;
  }
}


