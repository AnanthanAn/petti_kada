import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import 'package:petti_kada/models/order.dart';

class OrderItemCard extends StatefulWidget {
  final Order orderItem;

  OrderItemCard({@required this.orderItem});

  @override
  _OrderItemCardState createState() => _OrderItemCardState();
}

class _OrderItemCardState extends State<OrderItemCard> {
  var _dropDown = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('₹${widget.orderItem.totalAmount}'),
            subtitle: Text(
              DateFormat('dd-MM-yyyy hh:mm')
                  .format(DateTime.parse(widget.orderItem.timestamp)),
            ),
            trailing: IconButton(
                icon: _dropDown
                    ? Icon(Icons.expand_less)
                    : Icon(Icons.expand_more),
                onPressed: () {
                  setState(() {
                    _dropDown = !_dropDown;
                  });
                }),
          ),
          if (_dropDown)
            Container(
              height: min(widget.orderItem.products.length * 20.0 + 10.0, 100),
              child: ListView.builder(
                itemCount: widget.orderItem.products.length,
                itemBuilder: (ctx, idx) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(widget.orderItem.products[idx]['title']),
                    Text(
                        '${widget.orderItem.products[idx]['quantity']} x ${widget.orderItem.products[idx]['price']}'),
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}
