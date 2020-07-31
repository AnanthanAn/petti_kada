import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petti_kada/providers/products_provider.dart';
import 'package:petti_kada/screens/home_page.dart';
import 'package:petti_kada/screens/login_screen.dart';
import 'package:petti_kada/screens/products_screen.dart';
import 'package:petti_kada/screens/registration_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => ProductsProvider(),
      child: MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.green,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme:
                GoogleFonts.kronaOneTextTheme(Theme.of(context).textTheme),
            primaryTextTheme:
                GoogleFonts.kronaOneTextTheme(Theme.of(context).textTheme)),
        routes: {
          '/': (context) => HomePage(),
          LoginPage.routeName: (context) => LoginPage(),
          RegistrationScreen.routeName: (context) => RegistrationScreen(),
          ProductsScreen.routeName: (context) => ProductsScreen(),
        },
      ),
    );
  }
}
