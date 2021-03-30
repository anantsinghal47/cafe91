import 'dart:ui';

import 'package:cafe91/provider/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final String title;
  final double price;
  final int quantity;
  CartItem(this.id , this.productId , this.title , this.price , this.quantity);
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context ,listen: false);
    return Dismissible(
      direction: DismissDirection.startToEnd,
      onDismissed: (direction){
        cart.removeItem(productId);
      },
      key: ValueKey(id),
      background: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 20),
        margin: EdgeInsets.symmetric(horizontal: 0, vertical: 4),
        color: Colors.brown,
        child: Icon(
            Icons.delete,
          color: Colors.white,
          size: 30,
        ),
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        margin: EdgeInsets.symmetric(horizontal: 15 , vertical: 2),
        child:Container(
          //padding: EdgeInsets.all(0),
          child: ListTile(
            leading: CircleAvatar(
              maxRadius: 30,
              backgroundColor: Colors.brown[500],
              child: Text(
                '\₹${price*quantity}'
                , style:  TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold ,
                  color: Colors.white,
                fontFamily: 'QuickSand'
              ),
              ),
            ),
            title: Text(
              title,
              style:  TextStyle(
                  fontSize: 15 ,
                  fontWeight: FontWeight.bold ,
                  color: Colors.black54
              ),
            ),

            subtitle: Text(
              'Total: \₹${price*quantity}' ,
              style:  TextStyle(
                  color: Colors.black54,
                  fontFamily: 'QuickSand'
              ),
            ),
            trailing: Column(
              children: [
                Text( ' x $quantity ' ,  style:  TextStyle( fontSize: 15, color: Colors.black54)),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
