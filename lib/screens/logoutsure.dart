import 'dart:ui';

import 'package:cafe91/screens/LogInScreen.dart';
import 'package:cafe91/screens/cafeMainScreen.dart';
import 'package:flutter/material.dart';
class SureLogOut extends StatefulWidget {
  @override
  _SureLogOutState createState() => _SureLogOutState();
}

class _SureLogOutState extends State<SureLogOut> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        //appBar: AppBar(),
        body: Container(
          color: Colors.white60,
          padding: EdgeInsets.symmetric(vertical: 200 , horizontal: 20),
          height: 700,
          width: 400,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            ),
            elevation: 6,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 50),
                    child: Text(
                        "Confirm Logout ?",
                      style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20 , color: Colors.black54),
                    )),
                //SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20 , horizontal: 50),
                  child: Row(
                    children: [
                      FlatButton(
                        color: Colors.brown,
                        child: Text("Yes" , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold),),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => LogIn()
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
                          Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (context) => Cafe91MainScreen()
                          ));
                        },
                      ),

                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
