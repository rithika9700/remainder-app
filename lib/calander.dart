import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class calander extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyAppp(),
    );
  }
}


class MyAppp extends StatefulWidget {
  @override
  _MyApppState createState() => _MyApppState();
}

class _MyApppState extends State<MyAppp> {
  CalendarController _controller;
  List<dynamic> _selectedEvents;
  Map<DateTime,List<dynamic>> _events;
  TextEditingController _eventController;
  SharedPreferences prefs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = CalendarController();
    _eventController = TextEditingController();
    _selectedEvents = [];
    _events = {};
    initPrefs();

  }

  initPrefs() async {
    prefs = await SharedPreferences.getInstance();

    setState(() {
      _events = Map<DateTime,List<dynamic>>.from(decodeMap(json.decode(prefs.get("events")  ?? "{}")));
    });

  }


  Map<String,dynamic> encodeMap(Map<DateTime,dynamic> map){
    Map<String,dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[key.toString()] = map[key];


    });
    return newMap;
  }


  Map<DateTime,dynamic> decodeMap(Map<String,dynamic> map){
    Map<DateTime,dynamic> newMap = {};

    map.forEach((key, value) {
      newMap[DateTime.parse(key)] = map[key];

    });
    return newMap;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('calendar'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TableCalendar(
              events : _events,
              calendarStyle: CalendarStyle(
                todayColor: Colors.orange,


              ),
              onDaySelected: (date,events,_)  {
                setState(() {
                  _selectedEvents = events;
                });
                print(date.toIso8601String());
              },

              calendarController: _controller,
            ),
            ..._selectedEvents.map((events) => ListTile(
              title: Text(events),

            ),
            ),




          ],
        ),
      ),



      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          showDialog(
              context: context,
              builder: (BuildContext context){
                return AlertDialog(

                  content: TextField(
                    controller: _eventController,
                  ),
                  actions: [
                    FlatButton(
                      child: Text('save'),
                      onPressed: () {
                        if(_eventController.text.isEmpty) return;
                        setState(() {
                          if(_events[_controller.selectedDay] != null){
                            _events[_controller.selectedDay].add(_eventController.text);

                          }else{
                            _events[_controller.selectedDay] = [_eventController.text];
                          }
                          prefs.setString("events", json.encode(encodeMap(_events)));
                          _eventController.clear();
                          Navigator.pop(context);
                        });



                      },
                    ),
                  ],

                );
              }
          );
        },
      ),


    );



  }



}
































