import 'package:flutter/material.dart';
import 'package:petti_kada/constants/constants.dart';
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
    return Column(
      children: <Widget>[
        Container(
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    widget.title,
                    style: kTitleStyles,
                  ),
                  Text('₹${widget.price}'),
                  Consumer<CartProvider>(
                    builder: (_, cart, _2) => cart.items.containsKey(widget.id)
                        ? Row(
                            children: <Widget>[
                              IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {
                                    Provider.of<CartProvider>(context,
                                            listen: false)
                                        .decreaseQuantityCart(widget.id);
                                  }),
                              Text('${cart.items[widget.id].quantity}'),
                              IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    Provider.of<CartProvider>(context,
                                            listen: false)
                                        .addItemToCart(widget.id, widget.title,
                                            widget.price);
                                  }),
                            ],
                          )
                        : IconButton(
                            icon: Icon(Icons.add_shopping_cart),
                            onPressed: () {
                              Provider.of<CartProvider>(context, listen: false)
                                  .addItemToCart(
                                      widget.id, widget.title, widget.price);
                            }),
                  )
                ],
              ),
              Container(
                height: 100,width: 150,
                child: Image.network(
                  widget.imageURL,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
        Divider()
      ],
    );
  }
}
