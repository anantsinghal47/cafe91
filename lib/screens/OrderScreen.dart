import 'package:cafe91/widgets/orderListTile.dart';
import 'package:flutter/material.dart';
import 'package:cafe91/provider/orders.dart';
import 'package:provider/provider.dart';
class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context) ;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFF402C24),
        title: Text("Orders"),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only( top: 20 , right: 240 , bottom: 10),
            child:Text("Recent orders" , style: TextStyle(fontWeight: FontWeight.bold , color: Colors.black54),),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: orderData.orders.length,
              itemBuilder: (context , i){
                return OrderListTile(
                  orderData.orders[i],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
