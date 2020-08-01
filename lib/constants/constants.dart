import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petti_kada/providers/cart_provider.dart';
import 'package:petti_kada/widgets/badge.dart';
import 'package:provider/provider.dart';

const kButtonTextStyle = TextStyle(
    color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'Montserrat');

const kTextFieldLabelStyle = TextStyle(
    fontFamily: 'Montserrat', fontWeight: FontWeight.bold, color: Colors.grey);

const kHeaderStyles = TextStyle(
    fontFamily: 'Montserrat', fontWeight: FontWeight.bold, fontSize: 24);

TextStyle kTitleStyles = GoogleFonts.kronaOne(color: Colors.white);

AppBar setDefaultAppBar() {
  return AppBar(
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<CartProvider>(
          builder: (ctx, cart, _) => Badge(
            child: IconButton(
              icon: Icon(Icons.shopping_cart), onPressed: () {  },
            ),
            value: cart.items.length.toString(),
            color: Colors.lightGreenAccent,
          ),
        ),
      ),
    ],
    title: Text('ShopLift', style: kTitleStyles),
    backgroundColor: Colors.green,
  );
}
