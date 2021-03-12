
import 'dart:ui';
import 'package:cafe91/screens/LogInScreen.dart';
import 'package:cafe91/screens/cafeMainScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController usernameController = new TextEditingController();

  signMeUp(){
    if(formKey.currentState.validate()){
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => Cafe91MainScreen()
      ));
    }


}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cafe 91" , style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert_outlined),
            onPressed: (){},
          )
        ],
        toolbarHeight: 40,
        bottomOpacity: 2,
        backgroundColor: Colors.blueGrey,
      ),

      //bottomNavigationBar: SnackBar( ),
      body: SingleChildScrollView(
        child: Container(
          //height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/bg3.jpg"), fit: BoxFit.fill)),
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height -75 ,
              alignment: Alignment.center,
              child: Container(

                margin: EdgeInsets.only(top: 60),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius. circular(50),
                  ),
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(horizontal: 25 ,vertical: 0),
                  elevation: 5,
                  child: Container(
                    // decoration: BoxDecoration(
                    //     image: DecorationImage(
                    //         image: AssetImage("assets/images/bbbb.jg"), fit: BoxFit.contain )),
                    padding: EdgeInsets.symmetric(horizontal: 24 ,vertical: 20) ,
                    child: Column(
                      mainAxisSize: MainAxisSize.min ,
                      children: [
                        Form(
                          key: formKey,
                          child: Column(
                            //mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  "Create an Account  ",
                                  style: TextStyle(color: Colors.teal  , fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(height: 10,),
                              TextFormField(
                                validator : (val){
                                  return val.isEmpty  ?"Name should not be empty" : null;
                                },
                                controller: usernameController,
                                decoration: InputDecoration(
                                  hintText: "Your Name",
                                  hintStyle: TextStyle(
                                    color: Colors.teal,
                                  ),
                                ),

                              ),
                              TextFormField(
                                validator: (val){
                                  return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val)? null : "Enter valid email address";
                                },
                                controller: emailController,
                                decoration: InputDecoration(
                                  hintText: "email",
                                  hintStyle: TextStyle(
                                    color: Colors.teal,
                                  ),
                                ),

                              ),
                              TextFormField(
                                validator: (val){
                                  // password must be 6+ for firebase authentication
                                  return val.length> 6 ? null : "password must contain 6+ characters";
                                },
                                controller: passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: "password",
                                  hintStyle: TextStyle(
                                    color: Colors.teal,
                                  ),

                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),

                        GestureDetector(
                          onTap: (){
                            signMeUp();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(vertical: 7),
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.blueGrey , Colors.blueGrey
                                    ]
                                )
                            ),
                            child: Text(
                              "Sign Up" ,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: TextButton(
                            onPressed: (){
                              Navigator.pushReplacement(context, MaterialPageRoute(
                                builder: (context) => LogIn()
                              ));
                            },
                            child: Text("Already have an account ?" , style: TextStyle(color: Colors.teal),),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
