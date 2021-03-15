import 'package:cafe91/screens/LogInScreen.dart';
import 'package:cafe91/screens/SignUpScreen.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  void toggleView(){
    setState(() {
      showSignIn = !showSignIn;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showSignIn)  {
      return LogIn(toggleView);
    }
    else{
      return SignUp(toggleView);
    }
  }
}
