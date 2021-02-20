import 'package:flutter/material.dart';
import 'notipage.dart';

void main() =>
    runApp(search());


class search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Example9(),
    );
  }
}



class Example9 extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      appBar: AppBar(
        title: Text('BIRTHDAY REMAINDER'),
        actions: [
          IconButton(icon:Icon(Icons.search),onPressed: (){

            showSearch(context: context, delegate: DataSearch());

          }),
        ],
      ),
      body: Center(
        child: Container(
            height: 100,
            width: 400,
            child: Text('search your friends birthday here!',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 25),)
        ),
      ),
    );


  }
}

class DataSearch extends SearchDelegate<String>{


  final products =[

    "rithika",
    "priya",
    "jesi",
    "jo",
    "tamil",
    "harry",
    "louis",



  ];

  final recentproducts = [

    "rithika",
    "priya",
    "jesi",
    "jo",


  ];


  final dob =[

    "07-01-1980",
    "02-01-1890",
    "28-12-1999",
    "03-01-1888",
    "05-01-1990",
    "23-12-1999",
    "09-07-2000",

  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return[
      IconButton(icon: Icon(Icons.clear), onPressed: (){
        query = "";
      })
    ];

  }

  @override
  Widget buildLeading(BuildContext context) {

    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: (){});

  }

  @override
  Widget buildResults(BuildContext context) {

    return Card(



        child: Center(

          child: Container(
            height: 200,
            width: 200,
            child: Column(

              children: [
                Text('HAPPY BIRTHDAY!!',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize:18)),
                Text(query,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize:20)),

                RaisedButton(
                  child: Text('set notification'),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>notipage()));
                  },



                ),
            ],
            ),
          ),
        )

    );

  }

  @override
  Widget buildSuggestions(BuildContext context) {

    final suggestionlist = query.isEmpty ? recentproducts : products.where((element) => element.startsWith(query)).toList();

    return ListView.builder(
      itemCount: suggestionlist.length,
      itemBuilder: (context,index)=>ListTile(
        onTap: (){
          showResults(context);
        },
        leading: Icon(Icons.cake),
        title: Text(suggestionlist[index]),
        trailing: Text(dob[index]),
      ),


    );

  }
}