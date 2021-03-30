import 'package:flutter/foundation.dart';

class CartItem{
  final String id;
  final String title;
  final int quantity;
  final double price;
  CartItem({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price});
}

class Cart with ChangeNotifier {

  Map<String,CartItem> _items={};
  Map<String,CartItem>  get items {
    return {..._items};
  }
  int get itemCount{
    return _items == null ? 0 : _items.length;
  }
  double get totalPrice {
    var total =0.0;
    _items.forEach((key, cartItem) {
     total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(String id , String title , double price , int quantity){
    if(_items.containsKey(id)){
      print("hello");
      //change the quantity4
      _items.update(id, (existingItem) => CartItem(id: existingItem.id, title: existingItem.title, quantity: existingItem.quantity + quantity, price: existingItem.price));
    }
    else {
      print("hemlo");
      _items.putIfAbsent(id, () => CartItem(id: DateTime.now().toString(), title: title, quantity: quantity, price: price));
    }
    notifyListeners();
  }
  void removeItem(String productId){
    _items.remove(productId);
    notifyListeners();
  }
  void clear(){
    _items ={};
    notifyListeners();
  }
}