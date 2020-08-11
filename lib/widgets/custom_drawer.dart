import 'package:flutter/material.dart';
import 'package:petti_kada/constants/constants.dart';
import 'package:petti_kada/helpers/firebase_helper.dart';
import 'package:petti_kada/screens/cart_screen.dart';
import 'package:petti_kada/screens/home_page.dart';
import 'package:petti_kada/screens/orders_screen.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Container(child: Text('Hey There...',style: kAppBarTitleStyles,)),
            decoration: BoxDecoration(
              color: Colors.green,
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pushReplacementNamed(context, HomePage.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('My Cart'),
            onTap: () {
              Navigator.pushNamed(context, CartScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.credit_card),
            title: Text('My Orders'),
            onTap: () {
              Navigator.pushNamed(context, OrdersScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Contact Us'),
            onTap: () {
              showAboutDialog(context: context,applicationName: 'ShopLyft',applicationVersion: '1.0',);
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Log out'),
            onTap: () {
              FirebaseHelper.signOut();
            },
          ),
        ],
      ),
    );
  }
}
