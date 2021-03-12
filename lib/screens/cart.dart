

import 'dart:ui';

import 'package:flutter/material.dart';
class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("cart screen"),
        actions: [
          Icon(Icons.arrow_drop_down_sharp)
        ],
      ),
      body: Column(children: [
        Container(child: Text("Hello" , style: TextStyle(fontSize: 100),),),
      ],),
    );
  }
}
