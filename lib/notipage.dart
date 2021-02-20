import 'package:flutter/material.dart';
import 'selection.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';



class notipage extends StatefulWidget {

  @override
  _notipageState createState() => _notipageState();
}

class _notipageState extends State<notipage> {
  FlutterLocalNotificationsPlugin fltrNotification;
  String _selectedParam;
  String task;
  int val;



  @override
  void initState(){
    super.initState();
    var androidInitilize = new AndroidInitializationSettings('app_icon');
    var iOSinitilize = new IOSInitializationSettings();
    var initilizationsSettings =
    new InitializationSettings(android : androidInitilize, iOS: iOSinitilize);
    fltrNotification = new FlutterLocalNotificationsPlugin();
    fltrNotification.initialize(initilizationsSettings,
        onSelectNotification: notificationSelected);
  }

  Future _showNotification() async {
    Fluttertoast.showToast(msg:"notification set ",toastLength: Toast.LENGTH_SHORT);
    var androidDetails = new AndroidNotificationDetails(
        "test programmer", "Flutter programmer", "This is my project",
        importance: Importance.max);
    var iSODetails = new IOSNotificationDetails();
    var generalNotificationDetails =
    new NotificationDetails(android : androidDetails, iOS: iSODetails);

    var scheduledTime;
    if (_selectedParam == "Hour") {
      scheduledTime = DateTime.now().add(Duration(hours: val));
    } else if (_selectedParam == "Minutes") {
      scheduledTime = DateTime.now().add(Duration(minutes: val));
    } else if (_selectedParam == "Seconds"){
      scheduledTime = DateTime.now().add(Duration(seconds: val));
    } else {
    scheduledTime = DateTime.now().add(Duration(days: val));
    }

    fltrNotification.schedule(
        1, "Remainder!!!", task, scheduledTime, generalNotificationDetails);





  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightGreen,
        appBar: AppBar(
          title: Text('Set your notifications here!'),
        ),

        body: Center(

          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  onChanged: (_val) {
                    task = _val;
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DropdownButton(
                    value: _selectedParam,
                    items: [
                      DropdownMenuItem(
                        child: Text("Seconds"),
                        value: "Seconds",
                      ),
                      DropdownMenuItem(
                        child: Text("Minutes"),
                        value: "Minutes",
                      ),
                      DropdownMenuItem(
                        child: Text("Hour"),
                        value: "Hour",
                      ),
                      DropdownMenuItem(
                        child: Text("days"),
                        value: "days",
                      ),
                    ],
                    hint: Text(
                      "Select Your Field.",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    onChanged: (_val) {
                      setState(() {
                        _selectedParam = _val;
                      });
                    },
                  ),
                  DropdownButton(
                    value: val,
                    items: [
                      DropdownMenuItem(
                        child: Text("1"),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text("2"),
                        value: 2,
                      ),
                      DropdownMenuItem(
                        child: Text("3"),
                        value: 3,
                      ),
                      DropdownMenuItem(
                        child: Text("4"),
                        value: 4,
                      ),
                    ],
                    hint: Text(
                      "Select Value",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    onChanged: (_val) {
                      setState(() {
                        val = _val;
                      });
                    },
                  ),
                ],
              ),
              RaisedButton(
                onPressed: _showNotification,
                child: new Text('Set Task With Notification'),

              ),
            ],




          ),


        ),

      ),
    );


  }
  Future notificationSelected(String payload) async {

  }


}

