import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'BadgeImage.dart';
import 'Description.dart';

class ItemListImage extends StatelessWidget {
  final String _imgUrl;
  final String _namePicture;
  final String _author;

  ItemListImage(this._imgUrl, this._author, this._namePicture);

  @override
  Widget build(BuildContext context) {
    return Container( 
      constraints: BoxConstraints.expand(
        height: 100,
      ),
      decoration: BoxDecoration(color: Colors.white),
      
      child: Row( 
        children: <Widget>[
          BadgeImage(_imgUrl),
          Discription(_author, _namePicture)
        ]
      )  
    );
  }
}