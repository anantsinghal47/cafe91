

import 'package:flutter/cupertino.dart';

class Product{
  final String id;
  final String title;
  final double price;
  final String imgPath;
  final String description ;
  bool isFav;

  Product({
    @required this.id ,
    @required this.title ,
    @required this.price ,
    @required this.imgPath ,
    @required this.description ,
    this.isFav
  });

}