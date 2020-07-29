import 'package:flutter/material.dart';
import 'package:petti_kada/constants/constants.dart';
class CatCard extends StatelessWidget {
  final String imageURL ;
  final String titleLabel ;

  CatCard({this.titleLabel,this.imageURL

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Container(
          height: 150,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(onTap: (){},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.network(imageURL),
                  Text(titleLabel,style: kTextFieldLabelStyle,),
                  Icon(Icons.arrow_forward_ios,color: Colors.green,)
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