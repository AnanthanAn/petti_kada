import 'package:flutter/material.dart';
import 'package:petti_kada/constants/constants.dart';
import 'package:petti_kada/providers/cart_provider.dart';
import 'package:petti_kada/providers/order_provider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static String routeName = '/cart-screen';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: setDefaultAppBar(context),
      body: Column(
        children: <Widget>[
          Card(
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Total'),
                Chip(label: Text(cart.totalAmount.toString())),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (ctx, idx) => Dismissible(key: UniqueKey(),direction: DismissDirection.endToStart,
                  onDismissed: (_){
                    cart.removeProductFromCart(cart.items.keys.toList()[idx]);
                  },
                  child: ListTile(
                        title: Text(cart.items.values.toList()[idx].title),
                        trailing: Text(
                            cart.items.values.toList()[idx].quantity.toString()),
                      ),
                )),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Provider.of<OrderProvider>(context, listen: false)
                .placeOrder(cart.totalAmount, cart.items.values.toList());
          },
          label: Text('Place Order')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
