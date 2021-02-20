import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  static const routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('homepage'),
      ),

      body:Text('this is home screen'),

    );
  }
}
