

import 'dart:ui';

import 'package:flutter/material.dart';
class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFF402C24),
        title: Text("Search Food"),

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
