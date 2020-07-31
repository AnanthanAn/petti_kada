import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        child: Badge(
          child: Icon(Icons.shopping_cart),
          badgeContent: Text(
            '5',
            style: TextStyle(color: Colors.green),
          ),
          badgeColor: Colors.white,
        ),
      ),
    ],
    title: Text('ShopLift', style: kTitleStyles),
    backgroundColor: Colors.green,
  );
}
