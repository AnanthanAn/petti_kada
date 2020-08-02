import 'package:flutter/material.dart';
import 'package:petti_kada/constants/constants.dart';
import 'package:petti_kada/widgets/category_card.dart';
import 'package:petti_kada/widgets/custom_drawer.dart';

class HomePage extends StatefulWidget {
  static String routeName = 'home_page';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: setDefaultAppBar(context),
      drawer: CustomDrawer(),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Card(
              child: Container(
                child: Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/shoplift-c03d5.appspot.com/o/alvaro-serrano--kr8XPYuSI8-unsplash.jpg?alt=media&token=240dde38-bc42-4f6e-9f86-be0e50971e94'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Categories',
                  style: kHeaderStyles,
                ),
              ),
            ),
            CatCard(
              titleLabel: 'Bakery & \n Dairy',
              imageURL:
                  'https://firebasestorage.googleapis.com/v0/b/shoplift-c03d5.appspot.com/o/category%2Falana-harris-TcpYjs6qF9o-unsplash.jpg?alt=media&token=9bf7d70c-a281-4f9e-8708-5dff0b419778',
            ),
            CatCard(
              titleLabel: 'Grains & \n Oils',
              imageURL:
                  'https://firebasestorage.googleapis.com/v0/b/shoplift-c03d5.appspot.com/o/category%2Fbowl-close-up-dry-1311771.jpg?alt=media&token=67aeaf88-553d-442a-b591-b303c523a609',
            ),
            CatCard(
                titleLabel: 'Cosmetics',
                imageURL:
                    'https://firebasestorage.googleapis.com/v0/b/shoplift-c03d5.appspot.com/o/category%2Fthe-honest-company-jQ6HxTqSgfU-unsplash.jpg?alt=media&token=68dcd3a8-8569-4635-9f91-6971e9a540d7'),
            CatCard(
                titleLabel: 'Snacks & \n Food',
                imageURL:
                    'https://firebasestorage.googleapis.com/v0/b/shoplift-c03d5.appspot.com/o/category%2Frachael-gorjestani-evsoUV1EyXY-unsplash.jpg?alt=media&token=2a3e8bea-1eaa-41d4-af6a-e873441e397c'),
            CatCard(
              titleLabel: 'Beverages',
              imageURL:
                  'https://firebasestorage.googleapis.com/v0/b/shoplift-c03d5.appspot.com/o/category%2Fmarjan_blan-dwKj2x_VZII-unsplash.jpg?alt=media&token=51c197af-cee8-4f0b-9020-3529fabaf86f',
            ),
          ],
        ),
      ),
    );
  }
}
