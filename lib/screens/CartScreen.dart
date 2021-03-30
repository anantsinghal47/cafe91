import 'dart:ui';

import 'package:cafe91/provider/cart.dart' show Cart;
import 'package:cafe91/provider/orders.dart';
import 'package:cafe91/widgets/cartItems.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFF402C24),
        title: Text("Your Cart"),
      ),
      body: cart.itemCount != 0 ? Stack(
        children: [

          Column(children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
              ),
              elevation: 2,
              margin: EdgeInsets.all(15),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [



                    Container(
                      margin: EdgeInsets.only(left: 30),
                        child: Text(cart.itemCount.toString() + " items" , style: TextStyle(fontSize: 18 , color: Colors.black54),)),
                    SizedBox(width: 60,),
                    Text("Total:",
                      style:TextStyle(
                          fontSize: 20,
                          color: Colors.black54
                      ) ,
                    ),
                    SizedBox(width: 10,),
                    Flexible(
                      child: Chip(
                        label: Text('\₹ ${cart.totalPrice}',
                          style: TextStyle(color: Colors.black54 , fontFamily: "QuickSand" , fontWeight: FontWeight.bold),
                        ),
                        backgroundColor: Colors.amber[50],

                      ),
                    ),

                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: cart.items.length,
                  itemBuilder: (context , i)  => CartItem(
                    cart.items.values.toList()[i].id,
                    cart.items.keys.toList()[i],
                    cart.items.values.toList()[i].title,
                    cart.items.values.toList()[i].price,
                    cart.items.values.toList()[i].quantity,
                  )
              ),
            )
          ],
          ),
          Positioned(
            top: 615,
            left: 0,
            child: Container(
              width: MediaQuery.of(context).size.width ,
              height: 70,
              padding: EdgeInsets.symmetric(horizontal: 30 , vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
               gradient: LinearGradient(
                 colors: [Colors.transparent, Colors.transparent]
               )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      splashColor: Colors.brown,
                       focusColor: Colors.brown,
                       onTap: (){
                         final orders = Provider.of<Orders>(context ,listen: false);
                         orders.addOrder(cart.items.values.toList(), cart.totalPrice);
                         print("order placed");
                         cart.clear();
                       } ,
                      child: Container(
                        width: 160,
                          padding: EdgeInsets.symmetric(horizontal: 50 , vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.amber[50],
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.brown[300])
                        ),
                          child: Text(
                            "Place Order" , style: TextStyle(fontWeight: FontWeight.bold , color: Colors.black54 ) ,))
                  ),

                  Container(
                   // width: 150,
                    padding: EdgeInsets.symmetric(horizontal: 30 , vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color:Colors.amber[50],
                        border: Border.all(color: Colors.brown[300])
                    ),
                    child: Text('\₹ ${cart.totalPrice}' , style: TextStyle(fontFamily: "QuickSand" , color: Colors.black54 , fontWeight: FontWeight.bold),),
                  )
                ],
              ),
            ),
          ),
        ],
      ) : Center(child: Text("Nothing in the Cart!"),),
    );
  }
}
