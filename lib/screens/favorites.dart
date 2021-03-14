

import 'dart:ui';

import 'package:flutter/material.dart';
class FavScreen extends StatefulWidget {
  @override
  _FavScreenState createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFF402C24),
        title: Text("Your Favorites"),

      ),
      body: Container(
        child: Column(children: [
          Container(
              child:Text("")
          ),
        ],),
      ),
    );
  }
}
