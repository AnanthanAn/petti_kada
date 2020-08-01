import 'package:flutter/material.dart';
import 'package:petti_kada/constants/constants.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Container(child: Text('Hey There',style: kTitleStyles,)),
            decoration: BoxDecoration(
              color: Colors.green,
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('My Cart'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.credit_card),
            title: Text('My Orders'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Contact Us'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
