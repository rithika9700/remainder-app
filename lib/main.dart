import 'package:flutter/material.dart';
import 'homescreen.dart';
import 'signupscreen.dart';
import 'loginscreen.dart';
import 'package:provider/provider.dart';
import 'authentication.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

        ChangeNotifierProvider.value(value: Authentication())
      ],


      child: MaterialApp(
       title: 'LoginApp',


        home: loginScreen(),
        routes: {
         signupScreen.routeName:(ctx)=>signupScreen(),
          loginScreen.routeName:(ctx)=>loginScreen(),
          Homescreen.routeName:(ctx)=>Homescreen(),

        },







      ),
    );

  }
}
