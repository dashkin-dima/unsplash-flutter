import 'package:flutter/material.dart';

class Discription extends StatelessWidget {
  final String _namePicture;
  final String _author;

  Discription( this._author, this._namePicture);

  @override
  Widget build(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container( 
              width: 220.0,
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
              child:
                Text(
                  'author: $_author', 
                  style: 
                    Theme.of(context).textTheme.body1)
            ),
            Container( 
              width: 220.0,
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
              child:
                new Text(
                  'the name of the picture: \n$_namePicture', 
                  overflow: TextOverflow.ellipsis,
                  softWrap: false, 
                  style: Theme.of(context).textTheme.body1)
            )
          ]
    );
  }
}

              