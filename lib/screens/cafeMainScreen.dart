

import 'dart:ui';

import 'package:cafe91/screens/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
class Cafe91MainScreen extends StatefulWidget {
  @override
  _Cafe91MainScreenState createState() => _Cafe91MainScreenState();
}

class _Cafe91MainScreenState extends State<Cafe91MainScreen> {
  bool isFav = false;
  int _currentIndex = 0;
  fav(){
    print("pressed");
    setState(() {
      isFav = !isFav;
    });

  }
  cartRoom(){
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => CartScreen()
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.brown,
      ),
      bottomNavigationBar: BottomNavigationBar(
      backgroundColor: Color(0xffFF402C24),
        iconSize: 20,
        currentIndex: _currentIndex,

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),

            //backgroundColor: Colors.orangeAccent,
            backgroundColor: Color(0xffFF402C24),

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text("  search" ),
              backgroundColor: Color(0xffFF402C24)
          ),
          BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: (){
                  cartRoom();
                },
                  child: Icon(Icons.shopping_cart)),
              title: Text("cart"),
              backgroundColor: Color(0xffFF402C24)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text("  profile"),
              backgroundColor: Color(0xffFF402C24)
          ),
        ],
        selectedItemColor: Colors.amber[100],
        onTap: (index){
        setState(() {
          _currentIndex = index;

        });
        },
      ),
      body: Container(
        // decoration: BoxDecoration(
        //     image:DecorationImage(
        //         image: AssetImage("assets/images/co.jpeg"),
        //         fit: BoxFit.fitHeight
        //     )
        // ),
        child: ListView(
         children: [
          SizedBox(height: 0,),
           // Container(
           //   padding: EdgeInsets.symmetric(vertical: 80),
           //   decoration: BoxDecoration(
           //     image: DecorationImage(
           //       image: AssetImage("assets/images/adobe.png"),
           //       fit: BoxFit.fitWidth
           //     )
           //   ),
           // ),
           Container(
             height: 100,

             child: Padding(
               padding: const EdgeInsets.only(left: 15),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [

                   // Padding(
                   //   padding: EdgeInsets.only(right: 0),
                   //   child: Container(
                   //     height: 60,
                   //     width: 60,
                   //     // decoration: BoxDecoration(
                   //     //  // color: Colors.brown,
                   //     //  // borderRadius: BorderRadius.horizontal(left: Radius.circular(10) ,right:Radius.circular(100)  ),
                   //     //   //border: Border.all(color: Colors.brown),
                   //     //   image: DecorationImage(
                   //     //       image:AssetImage('assets/images/cafe91.JPG') ,
                   //     //     fit:  BoxFit.contain,
                   //     //   ),
                   //     // ),
                   //   ),
                   //),
                   Card(
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius. circular(100),
                     ),
                     elevation: 20,
                     child: Container(
                       padding: EdgeInsets.only(left: 30, top: 15 ,bottom: 15 , right: 30),
                       decoration: BoxDecoration(
                         //border: Border.all(color: Colors.brown ,width: 3),
                         borderRadius: BorderRadius.only(topRight: Radius.circular(20),  bottomLeft: Radius.circular(20)),
                         gradient: LinearGradient(
                           colors: [ Colors.brown,Color(0xffFF341006)]
                         )

                       ),

                         //padding: const EdgeInsets.only(left: 10 , right: 10, top: 10 ,bottom: 10),
                         child: Text(
                             "Welcome To Cafe 91!",
                             style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                               fontStyle: FontStyle.italic,
                               color: Colors.white
                             )
                         ),

                     ),
                   ),
                 ],
               ),
             ),
           ),
           SizedBox(height: 20),
           Padding(
             padding: const EdgeInsets.only(left: 35),
             child: Container(
               child: Row(
                 children: [
                   Text("Best Sellers" , style: TextStyle(fontWeight: FontWeight.bold),),
                   // Padding(
                   //   padding: EdgeInsets.only(left: 200),
                   //   child: Text("See all"  ,style: TextStyle(fontWeight: FontWeight.bold),),
                   // )
                 ],
               ),
             ),
           ),
           SizedBox(height: 5,),
           Container(
             // decoration: BoxDecoration(
             //     image:DecorationImage(
             //         image: AssetImage("assets/images/222.jpg"),
             //         fit: BoxFit.cover
             //     )
             // ),
            // color: Colors.white,
             height: 210,
             child: ListView(
               scrollDirection: Axis.horizontal,
               children: [
                 listCard("assets/images/samosa.jpg" , "Samosa" , "crispy potato samosa" , "₹20" , isFav),
                 listCard("assets/images/pizz1.jpg" , "Pizza" , "Double Cheese Pizza" , "₹200" ,isFav),
                 listCard("assets/images/pizz1.jpg" , "Sandwich" , " cheese corn" , "price" , isFav ),
                 listCard("assets/images/pizz1.jpg" , "Tea" , " chocolaty" , "price" , isFav ),
                 listCard("assets/images/pizz1.jpg" , "Coffee" , "capuchino" , "price" , isFav ),
               ],
             ),
           ),
           Container( padding : EdgeInsets.symmetric(horizontal: 100, vertical: 0),child: Text(" Swipe for great servings" , style: TextStyle(fontSize: 12),)),
           SizedBox(height: 28,),
           Container( padding : EdgeInsets.symmetric(horizontal: 30, vertical: 0),child: Text("Food catalogue" , style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)),
           Column(
             children: [
               Row(
                 children: [
                   menuList("Maggi","assets/images/mg.jpg"),
                   menuList("Pizzas","assets/images/shk.jpg"),

                 ],
               ),
               Row(
                 children: [
                   menuList("Maggi","assets/images/sw2.jpg"),
                   menuList("Pizzas","assets/images/ps4.jpg"),
                 ],
               ),
               Row(
                 children: [
                   Container( padding : EdgeInsets.symmetric(horizontal: 30, vertical: 10),child: Text("Meals And Combos" , style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)),
                 ],
               ),
               Row(
                 children: [
                   menuList("Maggi", "assets/images/mg.jpg"),
                   menuList("Pizzas","assets/images/re.jpg"),
                 ],
               ),
               Row(
                 children: [
                   menuList("Maggi","assets/images/ck2.jpg"),
                   menuList("Pizzas","assets/images/mg.jpg"),
                 ],
               ),
             ],
           ),

         ],
        ),
      ),
    );
  }
  listCard(String imgPath, String title , String desp, String price , bool isFav){
    return  Container(
      height: 200,

        padding: EdgeInsets.only(left: 20 , right:20 ),
        child: Container(

          height: 300,
          width: 300,
          child: Column(
            //mainAxisSize: MainAxisSize.max,
            children: [
              Stack(
                children: [
                  Container(
                    height: 200,
                  ),
                  Positioned(
                    top: 15,
                    child: Container(
                      padding: EdgeInsets.only(left: 10 , right: 10),
                      height: 160,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                          // Color(0xffFFF1AE81)
                          colors: [ Colors.brown , Color(0xffFF341006),]
                              //, Color(0xffFF99A6A8)
                        )
                      ),
                     child: Padding(
                       padding: const EdgeInsets.only( top: 10),
                       child: Column(

                         children: [
                           Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 10 , ),
                             child: Row(children: [
                                  SizedBox(width: 3,),
                                  Expanded(child: Text(title, style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20 , color: Colors.white))),
                                  SizedBox(width: 90,),
                                  Container(
                                     height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      //border: Border.all(color: Colors.grey),
                                      color: Colors.brown,
                                    ),
                                    child: IconButton(
                                      icon: Icon(Icons.favorite , color: isFav ?   Colors.red : Colors.white54),
                                      onPressed: (){
                                        fav();
                                      },
                                    ),
                                  )
                                  //SizedBox(height: 10,),
                                ],
                             ),
                           ),

                           Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 0),
                             child: Column(
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.only(left: 10),
                                   child: Row(children: [
                                     Text(desp, style: TextStyle(fontWeight: FontWeight.bold , fontSize: 15 , color: Colors.white54)),
                                   ],),
                                 ),
                                 SizedBox(height: 10,),
                                 Row(children: [
                                   Padding(
                                     padding: const EdgeInsets.only(left: 10),
                                     child: Text(price, style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20 , color: Colors.white)),
                                   ),
                                   SizedBox(width: 160,),

                                 ],)


                               ],
                             ),
                           )
                         ],
                       ),
                     ),
                    ),
                  ),
                  Positioned(
                      left: 180,
                     top: 125,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      height: 75,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(20) , bottomLeft:Radius.circular(20) , topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                        color: Colors.white,
                        border: Border.all(color: Color(0xffFFF1AE81) , width: 3 ,)
                      ),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(imgPath),
                            fit: BoxFit.scaleDown
                          )
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 150,
                    left: 40,
                    child: Card(
                      elevation: 7,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius. circular(100),
                      ),
                      child: InkWell(
                        onTap: (){
                          print("ORDER");
                        },
                        child: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Color(0xffFF341006) , width: 3 ,),
                              gradient: LinearGradient(
                                  colors: [  Color(0xffFFF1AE81) , Color(0xffFFF1AE81),]
                                //, Color(0xffFF99A6A8)
                              )
                          ),
                          child: Center(child: Text("Order Now", style: TextStyle(color:Color(0xffFF341006) , fontWeight: FontWeight.bold, fontSize: 15),)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

        ),
      );
  }
  menuList(String item ,String imgPath){
    return Padding(
      padding: const EdgeInsets.only(left: 20 , bottom: 5, top: 5),
      child: Container(

        //padding: EdgeInsets.only(left: 20 , right: 10),
        height: 100,
        width: 150,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          ),
          elevation: 4,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  // Color(0xffFFF1AE81)
                    colors: [ Colors.brown , Color(0xffFF341006),]
                  //, Color(0xffFF99A6A8)
                )
            ),
            child: Container(
              decoration: BoxDecoration(
                image:DecorationImage(
                  image: AssetImage(imgPath),
                  fit: BoxFit.fitHeight
                )
              ),
            ),
          ),
        )
      ),
    );
  }

}
