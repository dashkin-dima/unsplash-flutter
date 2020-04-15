import 'package:flutter/material.dart';

class BadgeImage extends StatelessWidget {
  final String _imgUrl;

  BadgeImage(this._imgUrl);

  @override
  Widget build(BuildContext context) {
    return Container( 
      constraints: BoxConstraints.expand(
        height: 100,
        width: 100,
      ),
      decoration: BoxDecoration(color: Colors.white),
      child: Image.network(
       _imgUrl,
        fit: BoxFit.cover)
    );
  }
}