import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  final String _assetPath;
   final String _title;
  ImageScreen(this._assetPath, this._title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Padding(
        padding: EdgeInsets.all(5.0),
        child:  Image.network(_assetPath),
      ),
    );
  }
}