import 'dart:ui';
import 'package:cafe91/helper/authenticate.dart';
import 'package:cafe91/screens/OrderScreen.dart';
import 'package:cafe91/screens/Settings.dart';
import 'package:cafe91/screens/cart.dart';
import 'package:cafe91/screens/favorites.dart';
import 'package:cafe91/screens/searchScreen.dart';
import 'package:cafe91/services/auth.dart';
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
  AuthMethods authMethods  = new AuthMethods();

  fav(){
    print("pressed");
    setState(() {
      isFav = !isFav;
    });

  }
  search(){
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => SearchScreen()
    ));
  }
    favorites(){
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => FavScreen()
    ));
  }
  cartRoom(){
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => CartScreen()
    ));
  }
   slideSheet() {
     if (true) {
       showModalBottomSheet(
           context: context,
           builder: (context) {
             return Container(
               //color: Color(0xFF737373),
               child: Container(
                 height: 200,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.only(
                       topLeft: Radius.circular(40),
                       topRight: Radius.circular(40)),
                   color: Colors.white,
                 ),
                 child: Card(
                   shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(10)
                   ),
                   elevation: 6,
                   child: Column(
                     children: [
                       Container(
                           padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 10),
                           child: Text(
                             "Confirm Logout ?",
                             style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20 , color: Colors.black54),
                           )),
                       //SizedBox(height: 10,),
                       Padding(
                         padding: const EdgeInsets.symmetric(vertical: 20 , horizontal: 76),
                         child: Row(
                           children: [
                             FlatButton(
                               color: Colors.brown,
                               child: Text("Yes" , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold),),
                               onPressed: (){
                                 authMethods.signOut();
                                 Navigator.pushReplacement(context, MaterialPageRoute(
                                     builder: (context) => Authenticate()
                                 ));
                               },
                             ),
                             SizedBox(
                               width: 20,
                             ),
                             FlatButton(
                               color: Colors.brown,
                               child: Text("No" ,style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold),),
                               onPressed: (){
                                 Navigator.pop(context);
                                 // Navigator.pushReplacement(context, MaterialPageRoute(
                                 //     builder: (context) => Cafe91MainScreen()
                                 // ));
                               },
                             ),

                           ],
                         ),
                       )
                     ],
                   ),
                 ),
               ),
             );
           });
     }
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: Container(
        padding: EdgeInsets.only(top: 33),
        child: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            //shrinkWrap: true,
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              Column(
                children: [
                  Container(
                    width: 350,
                    height: 150,
                    //margin: EdgeInsets.symmetric(horizontal: 0 , vertical: 10),
                   // padding: EdgeInsets.symmetric(horizontal: 20 ),
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(300),
                    //     color: Colors.black45
                    // ),
                    child: DrawerHeader(
                      decoration: BoxDecoration(
                          //borderRadius: BorderRadius.circular(50),
                          color: Color(0xffFF402C24)
                      ),
                          //curve: Curves.bounceInOut,
                          child: Column(
                            children: [

                              Container(
                                  margin : EdgeInsets.symmetric(vertical: 5),
                                  child: Text(" Hello User" , style: TextStyle( fontWeight: FontWeight.bold , color: Colors.white54 , fontSize: 20),))
                            ],
                          ),

                        ),
                  ),
                  //Center(child: Text("Name"),)
                ],
              ),
              ListTile(
                focusColor: Colors.brown,
                title: Text('Account Settings' ,style: TextStyle(fontWeight: FontWeight.bold , color: Colors.black54),),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => AccountSettings()
                  ));
                 // Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Your Orders',style: TextStyle(fontWeight: FontWeight.bold , color: Colors.black54)),
                onTap: () {

                  //Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => OrderScreen()
                  ));

                },
              ),
              ListTile(
                title: Text('Log Out',style: TextStyle(fontWeight: FontWeight.bold , color: Colors.black54)),
                onTap: () {
                  slideSheet();
                  // Navigator.pushReplacement(context, MaterialPageRoute(
                  //   builder: (context) => SureLogOut()
                  // ));
                  //Navigator.pop(context);
                },
              ),
              SizedBox(height: 420,),
              ListTile(
                title: Center(child: Text('Developed By Anant Singhal')),
                onTap: () {

                  //Navigator.pop(context);
                },
              ),

            ],
          ),
        ),
      ),
      appBar: AppBar(
        toolbarHeight: 45,
        backgroundColor: Color(0xffFF402C24),
        actions: [

          GestureDetector(
            onTap: (){
              slideSheet();
              // Navigator.push(context, MaterialPageRoute(
              //   builder: (context) => Authenticate()
              // ));
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Icon(Icons.logout ,),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
         backgroundColor: Color(0xffFF402C24),
        iconSize: 20,
        selectedFontSize: 13,
        unselectedFontSize: 13,
        currentIndex: _currentIndex,

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home , color: Colors.amber[100]),
            // ignore: deprecated_member_use
            title: Text("Home" , style: TextStyle(color:  Colors.white54 ,fontSize: 13), ),

            //backgroundColor: Colors.orangeAccent,
            backgroundColor: Color(0xffFF402C24),

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search , color: Colors.brown[50]),
            // ignore: deprecated_member_use
            title: Text("search " , style: TextStyle(color:  Colors.white54 ,fontSize: 13), ),
              backgroundColor: Color(0xffFF402C24)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite , color: Colors.red[200],),
              // ignore: deprecated_member_use
              title: Text("favorites" , style: TextStyle(color:  Colors.white54 , fontSize: 13), ),
              backgroundColor: Color(0xffFF402C24)
          ),
          BottomNavigationBarItem(
              icon:Icon(Icons.shopping_cart , color: Colors.orange[100], ),
              // ignore: deprecated_member_use
              title: Text("cart" , style: TextStyle(color:  Colors.white54, fontSize: 13), ),
              backgroundColor: Color(0xffFF402C24)
          ),

        ],
        selectedItemColor: Colors.amber[100],
        onTap: (index){
        setState(() {
          _currentIndex = index;
          if(_currentIndex==0){

          }
          else if(_currentIndex==1){
            search();
          }
          else if(_currentIndex==2){
            favorites();
          }
          else if(_currentIndex==3){
          cartRoom();
          }


         // slideSheet();

        });
        },
      ),
      body: Container(
        // decoration: BoxDecoration(
        //     image:DecorationImage(
        //         image: AssetImage("assets/images/adobe.png"),
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
            padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 10),

            child: Card(
              color:  Color(0xffFF341006),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              elevation: 10,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                   gradient: LinearGradient(
                     colors: [ Colors.brown , Color(0xffFF341006),]
                   )
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 50 , top: 15 , bottom:  15),
                  child: Row(
                    children: [
                      Text("Welcome To Cafe 91 !" , style: TextStyle(fontSize: 20 , fontStyle: FontStyle.italic , color: Colors.white , fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
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
           Container( padding : EdgeInsets.symmetric(horizontal: 30, vertical: 5),child: Text("Food catalogue" , style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)),
           Column(
             children: [
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 5),
                 child: Row(
                   children: [
                     menuList("Maggi","assets/images/mg.jpg"),
                     SizedBox(width: 10,),
                     menuList("Pizzas","assets/images/shk.jpg"),

                   ],
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 5),
                 child: Row(
                   children: [
                     menuList("Maggi","assets/images/sw2.jpg"),
                     SizedBox(width: 10,),
                     menuList("Pizzas","assets/images/ps4.jpg"),
                   ],
                 ),
               ),
               Row(
                 children: [
                   Container( padding : EdgeInsets.symmetric(horizontal: 30, vertical: 5),child: Text("Meals And Combos" , style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)),
                 ],
               ),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 5),
                 child: Row(
                   children: [
                     menuList("Maggi", "assets/images/mg.jpg"),
                     menuList("Pizzas","assets/images/re.jpg"),
                   ],
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 5),
                 child: Row(
                   children: [
                     menuList("Maggi","assets/images/ck2.jpg"),
                     menuList("Pizzas","assets/images/mg.jpg"),
                   ],
                 ),
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

        padding: EdgeInsets.only(left: 25 , right:20 ),
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
                                      icon: Icon(Icons.favorite , color: isFav ?   Colors.red[200] : Colors.white54),
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
                              border: Border.all(color: Color(0xffFFF1AE81) , width: 3 ,),
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
      padding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 5),
      child: Container(

        //padding: EdgeInsets.only(left: 20 , right: 10),
        height: 100,
        width: 150,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          ),
          elevation: 8,
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
