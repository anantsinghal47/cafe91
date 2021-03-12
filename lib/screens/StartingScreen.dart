

import 'dart:ui';

import 'package:cafe91/screens/LogInScreen.dart';
import 'package:cafe91/screens/SignUpScreen.dart';
import 'package:flutter/material.dart';

class StartingScreen extends StatefulWidget {
  @override
  _StartingScreenState createState() => _StartingScreenState();
}

class _StartingScreenState extends State<StartingScreen> {

  signMeUp(){
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => SignUp() ) );
  }
  signMeIn(){
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => LogIn()
    ) );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height -150,
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                //alignment: Alignment.bottomCenter,
                child: Image.asset("assets/images/cafe91.JPG"),
              ),
              SizedBox(
                height: 50,
              ),

              //Log In
              GestureDetector(
                onTap: (){
                  signMeIn();
                },
                child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 15 , horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.brown,
                  ),
                    child: Text(
                        "Log in" ,style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold
                    ),)
                ),
              ),

              SizedBox(
                height: 10,
              ),
              // sign Up
              GestureDetector(
                onTap: (){
                  signMeUp();
                },
                child: Container(
                  alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 15 , horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                       border: Border.all(color: Colors.brown , style: BorderStyle.solid),
                      color: Colors.white,
                    ),
                    child: Text(
                        "Sign Up" ,
                    style: TextStyle(
                      color: Colors.brown,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold
                    ),)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
