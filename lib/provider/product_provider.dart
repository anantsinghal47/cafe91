import 'package:flutter/material.dart';
import 'package:cafe91/modal/product.dart';
class Products with ChangeNotifier  {
  List<Product> _items = [
   Product(id: 'p1', title: "Cheese Samosa", price: 20, imgPath: 'assets/images/samosa.jpg', description: 'crispy potato samosa', isFav: false),
   Product(id: 'p2', title: "Paneer Pizza", price: 200, imgPath: 'assets/images/pizz1.jpg', description: 'Double Cheese Pizza',isFav: false),
   Product(id: 'p3', title: "Chole Kulche", price: 15, imgPath: 'assets/images/ck2.jpg', description: 'hot chick pea',isFav: false),
   Product(id: 'p4', title: "Chocolaty Chai", price: 40, imgPath: 'assets/images/pizz1.jpg', description: 'choco tea ',isFav: false),
   Product(id: 'p5', title: "Red Sauce Pasta", price: 60, imgPath: 'assets/images/ps4.jpg', description: 'pasta',isFav: false),

  ];

  List<Product> get items{
    return [..._items]; // copy of items
  }
  Product findById(String id){
    return _items.firstWhere((prod) => prod.id == id);
  }
  void addProduct(){
    //_items.add(value);
    notifyListeners();
  }
}