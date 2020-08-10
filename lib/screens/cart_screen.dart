import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:petti_kada/constants/constants.dart';
import 'package:petti_kada/providers/cart_provider.dart';
import 'package:petti_kada/providers/order_provider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  static String routeName = '/cart-screen';

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<ScaffoldState>();
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      key: key,
      appBar: setDefaultAppBar(context),
      body: Column(
        children: <Widget>[
          Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Total'),
                Chip(label: Text(cart.totalAmount.toString())),
              ],
            ),
          ),
          _isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Expanded(
                  child: ListView.builder(
                      itemCount: cart.items.length,
                      itemBuilder: (ctx, idx) => Dismissible(
                            key: UniqueKey(),
                            direction: DismissDirection.endToStart,
                            onDismissed: (_) {
                              cart.removeProductFromCart(
                                  cart.items.keys.toList()[idx]);
                            },
                            background: Container(
                              color: Colors.redAccent,
                              child: Icon(
                                Icons.delete,
                                color: Colors.white,
                                size: 24,
                              ),
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.only(right: 10),
                            ),
                            child: ListTile(
                              title:
                                  Text(cart.items.values.toList()[idx].title),
                              trailing: Text(cart.items.values
                                  .toList()[idx]
                                  .quantity
                                  .toString()),
                            ),
                          )),
                ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: Text('Do you want to place the order?'),
                actions: [
                  FlatButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                      },
                      child: Text('No')),
                  FlatButton(
                      onPressed: () async {
                        setState(() {
                          _isLoading = true;
                        });
                        Navigator.pop(ctx);
                        await Provider.of<OrderProvider>(context, listen: false)
                            .placeOrder(
                                cart.totalAmount, cart.items.values.toList());
                        Provider.of<CartProvider>(context, listen: false)
                            .clearCart();
                        BotToast.showSimpleNotification(title: "Order Placed",backgroundColor: Colors.lightGreen,);
                        Navigator.pop(context);
                      },
                      child: Text('Yes')),
                ],
              ),
            );
          },
          label: Text('Place Order')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

}
