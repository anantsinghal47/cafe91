
import 'dart:ui';

import 'package:cafe91/services/auth.dart';
import 'package:flutter/material.dart';

class ForgotPass extends StatefulWidget {
  @override
  _ForgotPassState createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  final globalKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  AuthMethods authMethods = new AuthMethods();
  TextEditingController email = new TextEditingController();
  void clearText(){
    email.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      body: SingleChildScrollView(
          child: Container(
             height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/bg3.jpg"),
                    fit: BoxFit.fitHeight
                )
            ),
            child: Container(
              height: 300,
              padding: EdgeInsets.only(top: 200),
              margin: EdgeInsets.only(right: 10 , left: 10 , bottom: 250 , top: 40),
              child: Card(
                elevation: 5,
                child: Container(
                  //height: 200,
                  //width: 300,
                  margin: EdgeInsets.only(top: 50 ,),
                  child: Column(
                    children: [
                      Text("Enter Your Account Email" ,style: TextStyle( color: Colors.teal , fontWeight: FontWeight.bold),),
                      SizedBox(height: 40,),
                      Container(

                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Form(
                          key: formKey,
                          child: TextFormField(
                            validator: (val){
                              return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val)? null : "Enter valid email address";
                            },
                            controller: email,
                            decoration: InputDecoration(
                              hintText: "email" ,
                              hintStyle: TextStyle(color: Colors.black54)
                            ),
                          ),
                        ),
                      ),
                      //SizedBox(height: 50,),
                      Container(
                        margin: EdgeInsets.only(top: 30 , bottom: 20),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(
                                colors: [
                                  Colors.blueGrey , Colors.blueGrey
                                ]
                              ),
                            ),
                          child: GestureDetector(
                            onTap: (){
                              if(formKey.currentState.validate()) {
                                final snackBar = SnackBar(content: Text(
                                    'password reset link sent to email provided'));
                                globalKey.currentState.showSnackBar(snackBar);
                                authMethods.resetPassword(email.text);
                                clearText();
                              }
                              else{
                                clearText();
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 50),
                              child: Text("Reset Password" ,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),),),
                          ),
                          ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
  }
}
