import 'package:flutter/material.dart';
import 'package:petti_kada/constants/constants.dart';
import 'package:petti_kada/screens/products_screen.dart';

class CatCard extends StatelessWidget {
  final String imageURL;
  final String titleLabel;
  final String catId;

  CatCard(
      {@required this.titleLabel,
      @required this.imageURL,
      @required this.catId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Container(
          height: 150,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductsScreen(catId)));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FadeInImage.assetNetwork(placeholder: 'images/placeholder.png',
                      image : imageURL),
                  Text(
                    titleLabel,
                    style: kTextFieldLabelStyle,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.green,
                  )
                ],
              ),
            ),
          ),
        ),
        elevation: 7.0,
      ),
    );
  }
}
