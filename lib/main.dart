import 'package:cafe91/provider/cart.dart';
import 'package:cafe91/screens/CartScreen.dart';
import 'package:cafe91/screens/cafeMainScreen.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cafe91/provider/product_provider.dart';
import 'package:provider/provider.dart';
import 'package:cafe91/provider/orders.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
          create: (context) => Products(),
          ),
          ChangeNotifierProvider(
            create: (context) => Cart(),
          ),
          ChangeNotifierProvider(
            create: (context) => Orders() ,
          ),

        ],
      child: MaterialApp(
        title: "cafe91",
           debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Raleway',
          primaryColor: Colors.brown,
          scaffoldBackgroundColor: Colors.white,
          //primarySwatch: Colors.lightBlue,
        ),
        home:Cafe91MainScreen(),
        routes: {
          CartScreen.routeName : (context) => CartScreen(),
        },
      ),
    );
  }
}
