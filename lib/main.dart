import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petti_kada/providers/cart_provider.dart';
import 'package:petti_kada/providers/order_provider.dart';
import 'package:petti_kada/providers/products_provider.dart';
import 'package:petti_kada/screens/cart_screen.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => ProductsProvider()),
        ChangeNotifierProvider(create: (ctx) => CartProvider()),
        ChangeNotifierProvider(
          create: (ctx) => OrderProvider(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.green,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme:
                GoogleFonts.kronaOneTextTheme(Theme.of(context).textTheme),
            primaryTextTheme:
                GoogleFonts.kronaOneTextTheme(Theme.of(context).textTheme)),
        home: StreamBuilder(
            stream: FirebaseAuth.instance.onAuthStateChanged, builder: (context,userSnap){
              if(userSnap.connectionState == ConnectionState.waiting){
                return Center(child: CircularProgressIndicator(),);
              }
              if(userSnap.hasData){
                return HomePage();
              }
              return LoginPage();
        }),
        routes: {
          LoginPage.routeName: (context) => LoginPage(),
          HomePage.routeName: (context) => HomePage(),
          RegistrationScreen.routeName: (context) => RegistrationScreen(),
          CartScreen.routeName: (context) => CartScreen(),
        },
      ),
    );
  }
}
