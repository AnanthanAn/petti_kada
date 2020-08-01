import 'package:flutter/material.dart';
import 'package:petti_kada/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatefulWidget {
  final String id;
  final String title;
  final String imageURL;
  final double price;
  ProductItem(
      {@required this.id,
      @required this.title,
      @required this.imageURL,
      @required this.price});
  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[Text(widget.title),
              Text('₹${widget.price}'),
              IconButton(icon: Icon(Icons.add_shopping_cart), onPressed: (){
                Provider.of<CartProvider>(context,listen: false).addItemToCart(widget.id, widget.title, widget.price);
                print(Provider.of<CartProvider>(context,listen: false).items.length);
              })
            ],
          ),
          Spacer(),
          Container(
            height: 100,
            child: Image.network(widget.imageURL),
          )
        ],
      ),
    );
  }
}
