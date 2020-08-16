import 'package:flutter/material.dart';
import 'package:petti_kada/constants/constants.dart';
import 'package:petti_kada/models/order.dart';
import 'package:petti_kada/providers/order_provider.dart';
import 'package:petti_kada/widgets/order_item_card.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatefulWidget {
  static const String routeName = '/orders-screen';
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    var orders = Provider.of<OrderProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: Text('My Orders'),),
      body: FutureBuilder(
          future: orders.fetchOrdersForUser(),
          builder: (ctx, dataSnap) {
            if (dataSnap.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
                itemCount: orders.items.length,
                itemBuilder: (ctx, idx) => OrderItemCard(
                    orderItem: Order(
                        products: orders.items[idx].products,
                        orderId: orders.items[idx].orderId,
                        totalAmount: orders.items[idx].totalAmount,
                        timestamp: orders.items[idx].timestamp)));
          }),
    );
  }
}
