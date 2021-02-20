import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';


class flutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('adminpage'),
        ),
        body: Container(

          child: Center(
            child: Column(



              children:[

                Text('THIS PAGE IS FOR ADMIN USE ONLY',style:TextStyle(color: Colors.lime,fontSize: 30.0,fontWeight: FontWeight.bold)),


              SizedBox(
                height: 200,
              ),
              new InkWell(
                child: new Text('Open Browser',style:TextStyle(color: Colors.white,fontSize: 20.0)),
                onTap: () => launch('https://console.firebase.google.com/u/0/project/flutterproject1-6d766/authentication/users'),
              ),

              ],
            ),
          ),
        ),
      ),

    );
  }
}
