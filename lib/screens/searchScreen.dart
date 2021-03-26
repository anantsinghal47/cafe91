
import 'dart:ui';

import 'package:cafe91/screens/cafeMainScreen.dart';
import 'package:cafe91/screens/favorites.dart';
import 'package:flutter/material.dart';
class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int _currentIndex = 0;

  fav(String id){


    setState(() {
      // if(id == productId[0]) {
      //   favIndicator[0] = !favIndicator[0];
      // }
      // if(id == productId[1]) {
      //   favIndicator[1] = !favIndicator[1];
      // }
      // if(id == productId[2]) {
      //   favIndicator[2] = !favIndicator[2];
      // }
      // if(id == productId[3]) {
      //   favIndicator[3] = !favIndicator[3];
      // }
      // if(id == productId[4]) {
      //   favIndicator[4] = !favIndicator[4];
      //}
    });

  }


  search(){
    // Navigator.push(context, MaterialPageRoute(
    //     builder: (context) => SearchScreen()
    // ));
  }
  favorites(){
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => FavScreen()
    ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFF402C24),
        title: Text("search food"),

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
              Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) => Cafe91MainScreen()
              ));
            }
            else if(_currentIndex==1){
              //search();
            }
            else if(_currentIndex==2){
              favorites();
            }
            else if(_currentIndex==3){
              //cartRoom();
            }


            // slideSheet();

          });
        },
      ),
      body: Container(
        child: Column(children: [
          Container(
              child:Text("")
          ),
        ],),
      ),
    );
  }
}
