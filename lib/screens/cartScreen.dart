import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:cafe91/modal/product.dart';
import 'package:cafe91/screens/cafeMainScreen.dart';
// ignore: must_be_immutable
class CartScreen extends StatefulWidget {
  List<Product> tempCartItem;
  CartScreen(this.tempCartItem);
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  //final DismissDirectionCallback onDismissed;
  // final disKey = GlobalKey<>();
  List<Product> cartList=[];
  double totalPrice=0;
  totalPriceOfItems(){
    cartList = widget.tempCartItem;
    for(int i =0 ; i < widget.tempCartItem.length ; i++){
      totalPrice +=  widget.tempCartItem[i].price * widget.tempCartItem[i].cartIndex;
    }
  }
  void dismissItem(BuildContext context , int index , DismissDirection direction,){
    setState(() {
      bool t = false;
      totalPrice = totalPrice - widget.tempCartItem[index].price * widget.tempCartItem[index].cartIndex;
      //widget.tempCartItem[index].cartIndex = 0 ;

      widget.tempCartItem.removeAt(index);
      if(widget.tempCartItem.isEmpty) {
         t = true;
      }
      print(widget.tempCartItem.length);
      Cafe91MainScreen.updatedList(widget.tempCartItem , t , 1);
      print("item removed");
      // function which send updated list

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    totalPriceOfItems();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFF402C24),
        title: Text("Your Cart"),

      ),
      body:   widget.tempCartItem.isNotEmpty ?   Container(
        color: Colors.white,
        child: Stack(
          children: [
             totalPrice != 0 ? Container(
              alignment: Alignment.bottomCenter,
              //color: Colors.orange[50],
              child: Container(

                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black54),
                      color: Colors.white
                    ),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(19),
                            color: Colors.brown
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 20 , vertical: 25),
                          child: Text("Proceed to Payment" , style: TextStyle(fontWeight: FontWeight.bold , color: Colors.white),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Row(
                            children: [
                              Text("Total  :" , style:  TextStyle(fontWeight: FontWeight.bold , color: Colors.black54),),
                              SizedBox(width: 10,),
                              Container(
                                height: 40,
                                child: Column(
                                  children: [
                                    Text( widget.tempCartItem.length.toString() + " items", style: TextStyle(fontWeight: FontWeight.bold , fontSize: 10),),
                                    Text("₹ " +totalPrice.toString() , style: TextStyle(fontWeight: FontWeight.bold),),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              ),
            ) : Container(),
              ListView.builder(

                itemCount: widget.tempCartItem.length,
                itemBuilder: (context, index){

                  return   Dismissible(
                    //direction: DismissDirection.startToEnd,
                    onDismissed: (direction){
                      dismissItem(context , index ,direction);
                    },
                    key: ObjectKey(widget.tempCartItem.elementAt(index)),
                    background: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.redAccent[100]
                      ),
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: 20 ),
                      margin: EdgeInsets.only(top: 5 , bottom: 5 , left:  4, ),
                    //  color: Colors.redAccent[100],
                      child: Icon(Icons.delete_forever , color: Colors.white54,),
                    ),
                    child: CartFile(
                        widget.tempCartItem.elementAt(index).title ,
                        widget.tempCartItem.elementAt(index).price ,
                        widget.tempCartItem.elementAt(index).cartIndex,
                        index,
                        widget.tempCartItem
                    ),
                  ) ;

                }


            ),
          ],
        ),
      ) : Container(
        //color: Colors.orange[50],
        child: Center(child: Container(
            child: Text("Nothing in the cart !" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 15 , color: Colors.black54),)),),
      ),
    ) ;
  }
}
// ignore: must_be_immutable
class CartFile extends StatefulWidget {
  final String itemTitle;
  final int itemPrice;
  int cartIndex;
  int index;
  List<Product> cartList=[];

  CartFile(  this.itemTitle , this.itemPrice , this.cartIndex , this.index , this.cartList);
  @override
  _CartFileState createState() => _CartFileState();
}

class _CartFileState extends State<CartFile> {
  cartIncrementGiver(cartIndex , title , price){
      if(cartIndex!= 0){
        Product tempProduct = new Product( title, price, cartIndex);
        widget.cartList.add(tempProduct);
      }
    }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 2),
      height: 80,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        color: Colors.white,
        elevation: 1,
        child: Container(
          padding: EdgeInsets.only(left: 20 , top: 5),
          child: Row(
            children: [
              Row(
                children: [
                  Container(
                      padding: EdgeInsets.only(right: 40),
                      child: Text( widget.itemTitle + "    X   " + widget.cartIndex.toString() , style: TextStyle(fontWeight: FontWeight.bold),)),
                ],
              ),
              //SizedBox(width: 30,),
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      // setState(() {
                      //   widget.cartIndex += 1;
                      //   cartIncrementGiver(widget.cartIndex,  widget.itemTitle, widget.itemPrice);
                      //   print("cartIndex incremented");
                      // });

                    },
                    child: Container(
                        padding: EdgeInsets.only(right: 8),
                        child: Text(
                            "+" ,
                            style: TextStyle(
                              fontSize: 25 ,
                            )
                        )
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [
                          Colors.brown , Color(0xFF865751),
                        ]
                      ),
                    ),
                      padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 5),
                      child: Text(
                          widget.cartIndex.toString(),
                        style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold),
                      ),
                  ),
                  GestureDetector(
                    onTap: (){
                      print("cartIndex decremented");
                    },
                    child: Container(
                        padding: EdgeInsets.only(left: 8),
                        child: Text(
                            "-" ,
                            style: TextStyle(
                              fontSize: 25 ,
                            )
                        )
                    ),
                  ),
                ],
              ),
              Row(
               // margin: EdgeInsets.only(left: 30),
               children: [
                 Padding(padding: EdgeInsets.only(right: 30),),
                 Text("\₹ ${((widget.itemPrice)*(widget.cartIndex)).toString()}" , style: TextStyle(fontWeight: FontWeight.bold),),
               ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

//
//