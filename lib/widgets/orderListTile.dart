import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cafe91/provider/orders.dart';
import 'package:intl/intl.dart';
import 'dart:math';

class OrderListTile extends StatefulWidget {
  final OrderItem order;
  OrderListTile(this.order);

  @override
  _OrderListTileState createState() => _OrderListTileState();
}

class _OrderListTileState extends State<OrderListTile> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin:  EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('\₹ ${widget.order.amount}' , style:  TextStyle(fontFamily: 'QuickSand'),),
            subtitle: Text( DateFormat('dd MMMM yy   kk:mm a'
            ).format(widget.order.dateTime) , style: TextStyle(fontFamily: 'OpenSans'),),
            trailing: IconButton(
                icon : Icon(_expanded ? Icons.expand_less: Icons.expand_more),
              onPressed: (){
                    setState(() {
                      _expanded = !_expanded;
                    });
              },
            ),
          ),
          if(_expanded) Container(
            height: min(widget.order.products.length*20.0 + 80 , 180),
            child: ListView(
              children: widget.order.products.map((prod) =>
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text(prod.title , style: TextStyle(fontSize: 15 , fontFamily: "QuickSand"),),
                  //  Spacer(),
                  Text('${prod.quantity}  x ₹${prod.price}' , style: TextStyle(fontSize: 15 , fontFamily: "QuickSand"  ),),
                ],),
              )
              ).toList(),
            ),
          )
        ],
      ),
    );
  }
}
