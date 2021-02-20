import 'package:flutter/material.dart';
import 'notipage.dart';
import 'calander.dart';
import 'remainder.dart';
void main() {
  runApp(MyFlutter());
}
class MyFlutter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('selection page'),
        ),
        body: Center(

          child: Container(
            width: 600,
              height: 900,

              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/bgm.jpg'),
                  fit: BoxFit.cover,
                )
              ),
              child: Column(
                children: [

                  RaisedButton(
                      child:Text('set notifications here'),
                      color: Colors.lightGreenAccent,
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>notipage()),
                        );

                      },
                    ),
                  RaisedButton(
                      child: Text('calander'),
                    color: Colors.lightGreenAccent,
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>calander()));

                      },
                    ),

                  RaisedButton(
                    child: Text('remainder'),
                    color: Colors.lightGreenAccent,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>search()));

                    },
                  ),

                ],
              ),
            ),




        ),
      ),

    );
  }
}
