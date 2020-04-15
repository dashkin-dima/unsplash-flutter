import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:testjob/config.dart';
import 'package:testjob/screen/Image/ImageScreen.dart';


import 'ItemListImage/ItemListImage.dart';

class ListImageScreen extends StatefulWidget {
  @override
  _ListImageScreen createState() => _ListImageScreen();
}

class _ListImageScreen extends State<ListImageScreen> {
  List myList;
  ScrollController _scrollController = ScrollController();
  int _currentMax = 10;

  @override
  void initState() {
    super.initState();
    myList = List.generate(10, (i) => "Item : ${i + 1}");
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });
  }

  _getMoreData() {
    for (int i = _currentMax; i < _currentMax + 10; i++) {
      myList.add("Item : ${i + 1}");
    }

    _currentMax = _currentMax + 10;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("unplash"),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemExtent: 80,
        itemBuilder: (context, i) {
          if (i == myList.length) {
            return CupertinoActivityIndicator();
          }
          return  new FutureBuilder(
            future: _getData(),
        builder: (context, snapShot){
          Map data =  snapShot.data;
          if(snapShot.hasError || data.containsKey('errors')) {
            return Text('Failed to get response from the server',
            style: TextStyle(
              color: Colors.red,
              fontSize: 22.0),);
          } else if(snapShot.hasData) {
              return GestureDetector(
                onTap: () => _onTap(context, '${data['urls']['full']}', '${data['description']}'),
                child: ItemListImage('${data['urls']['small']}', '${data['user']['name']}','${data['description']}')
              );
          }  else if(!snapShot.hasData) {
            return new Center(
              child: CircularProgressIndicator()
            );
          }    
        });
        },
        itemCount: myList.length + 1,
      ),
    );
  }
  _onTap(BuildContext context, String imgUrl, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImageScreen(imgUrl, title)
      )
    );
  }
  Future<Map> _getData() async {
    String url = 'https://api.unsplash.com/photos/random?client_id=$apiKey';
    http.Response response = await http.get(url);
    return json.decode(response.body);
  }
}





