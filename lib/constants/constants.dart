import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screens/cart_screen.dart';
import '../providers/cart_provider.dart';
import '../widgets/badge.dart';
import 'package:provider/provider.dart';

TextStyle kButtonTextStyle = GoogleFonts.kronaOne(
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

TextStyle kTextFieldLabelStyle =
    GoogleFonts.kronaOne(fontWeight: FontWeight.bold, color: Colors.grey);

TextStyle kHeaderStyles = GoogleFonts.kronaOne(
    fontWeight: FontWeight.bold, fontSize: 24, color: Colors.blueGrey);

TextStyle kAppBarTitleStyles = GoogleFonts.kronaOne(color: Colors.white);

TextStyle kTitleStyles =
    GoogleFonts.kronaOne(color: Colors.blueGrey, fontSize: 20);

AppBar setDefaultAppBar(BuildContext context) {
  return AppBar(
    actions: <Widget>[
      Consumer<CartProvider>(
        builder: (ctx, cart, _) => Badge(
          child: IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, CartScreen.routeName);
            },
          ),
          value: cart.items.length.toString(),
          color: Colors.lightGreenAccent,
        ),
      ),
    ],
    title: Text('ShopLift', style: kAppBarTitleStyles),
    backgroundColor: Colors.green,
  );
}
