import 'package:cafe91/screens/LogInScreen.dart';
import 'package:cafe91/screens/cafeMainScreen.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "cafe91",
         debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Raleway',
        primaryColor: Colors.brown,
        scaffoldBackgroundColor: Colors.white,
        //primarySwatch: Colors.lightBlue,
      ),
      home: LogIn()
    );
  }
}
