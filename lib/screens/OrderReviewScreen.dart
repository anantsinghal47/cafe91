
import 'package:flutter/material.dart';
import 'package:cafe91/modal/product.dart';
// ignore: must_be_immutable
class OrderReview extends StatefulWidget {
   String foodTitle;
    int foodPrice;    int cartIndex;
    List<Product> tempCartItem;
    OrderReview(this.foodTitle , this.foodPrice, this.cartIndex , this.tempCartItem);



  @override
  _OrderReviewState createState() => _OrderReviewState();
}

class _OrderReviewState extends State<OrderReview> {


  // check(){
  //   setState(() {
  //     for(int i =0 ; i < widget.tempCartItem.length ; i++)
  //     {
  //       for(int j =0 ; j < widget.tempCartItem.length-1 ; j++){
  //         if(widget.tempCartItem[i].title == widget.tempCartItem[j+1].title){
  //           //widget.tempCartItem[i] =widget.tempCartItem[j+1];
  //           widget.tempCartItem.removeAt(i);
  //           //continue;
  //         }
  //
  //       }
  //
  //       return widget.tempCartItem.length;
  //       print(widget.tempCartItem.length);
  //
  //
  //
  //     }
  //
  //   });
  //   //print(widget.tempCartItem.length);
  //
  //
  // }
 @override
  void initState() {
    // TODO: implement initState

    super.initState();
    // check();
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 45,
        backgroundColor: Color(0xffFF402C24),
      ),
      body:ListView(
        children: [
          ListView.builder(

              itemCount: widget.tempCartItem.length,
              itemBuilder: (context, index){

                return  OrderList(
                    widget.tempCartItem[index].title ,
                    widget.tempCartItem[index].price ,
                    widget.tempCartItem[index].cartIndex,
                    index
                );
              }


          ),
          Container(
            color: Colors.blueGrey,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20)
            ),
            child: Text(
                " Proceed to Payment"
            ),
          )
        ],
      )
    );
  }
}

// ignore: must_be_immutable
class OrderList extends StatelessWidget {
  final String itemTitle;
  final int itemPrice;
  int cartIndex;
  int index;

  OrderList(  this.itemTitle , this.itemPrice , this.cartIndex , this.index);
  // String itemTitle = this.itemTitle;
  // Product tempCartItem = new Product(itemTitle , itemPrice , id , cartIndex);
  // List<Product> cartItems ;
  // cartItems.add(tempCartItem);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(left: 20 , top: 20),
          child: Row(
            children: [
              Text((index+1).toString() + ")   " + itemTitle + "    X   " + "  $cartIndex"),
              Padding(
                padding: EdgeInsets.only(left: 150),
                child: Text("\₹${(itemPrice*cartIndex).toString()}"),
              )
            ],
          ),
        ),
      ),
    );
  }
}


