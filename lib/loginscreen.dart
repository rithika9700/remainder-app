import 'package:flutter/material.dart';
import 'signupscreen.dart';
import 'package:provider/provider.dart';
import 'authentication.dart';
import 'selection.dart';
import 'admin.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'admin.dart';

class loginScreen extends StatefulWidget {
  static const routeName = '/login';
  @override
  _loginScreenState createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  bool login;

  final GlobalKey<FormState> _formKey = GlobalKey();


  Map<String,String> _authdata = {

    'email' : '',
    'password' : '',
  };
  void _showErrorDialog(String msg)
  {
    showDialog(
        context: context,
      builder: (ctx) => AlertDialog(
        title: Text('error occured'),
        content: Text(msg),
        actions: [
          FlatButton(
            child: Text('okay'),
            onPressed: (){
              Navigator.of(ctx).pop();
            },
          )
        ],
      )

    );

  }


  Future<void> submit() async{
    if(!_formKey.currentState.validate())
    {
      return;
    }
    _formKey.currentState.save();


    try{
      login=true;

      await Provider.of<Authentication>(context,listen: false).logIn(_authdata['email'],_authdata['password']);

      print('logged in');
      if(login=true)
        Navigator.push(context, MaterialPageRoute(builder: (context)=>MyFlutter()));





    }catch(error)
    {
      login=false;


      var errorMessage = 'Authentication failed try again';
      _showErrorDialog(errorMessage);
      print('error');
      if(login=false)
        print('login failed');



    }




  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('login page'),

        actions: [
          FlatButton(

            child: Row(
              children: [
                Text('signup'),
                Icon(Icons.person_add),



              ],

            ),
            onPressed: (){
              Navigator.of(context).pushReplacementNamed(signupScreen.routeName);
            },

          ),
          FlatButton(
            child:Row(
              children: [
                Text('admin'),
                Icon(Icons.edit),
              ],
            ),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>flutterApp()));

            },


          ),



        ],
      ),

      body: Stack(
        children: [
          Container(

            decoration: BoxDecoration(
              gradient: LinearGradient(
               colors:[
                 Colors.lightBlue,
                 Colors.pink,


               ]
              )


            ),


          ),
          Center(
            child: Container(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(labelText: 'email'),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value){
                          if(value.isEmpty || !value.contains('@')){
                            return 'invalid email';
                           }
                          return null;
                        },
                        onSaved: (value){
                          _authdata['email'] = value;

                        },




                      ),

                      TextFormField(
                        decoration: InputDecoration(labelText: 'password'),
                        obscureText: true,

                        validator: (value){
                          if(value.isEmpty || value.length<=5){
                            return 'invalid password';
                          }
                          return null;
                        },
                        onSaved: (value){
                          _authdata['password'] = value;

                        },



                      ),
                      RaisedButton(

                        child:Text('login'),
                        onPressed: (){
                          submit();

                        },

                      ),


                    ],


                  ),


                ),



              ),


            ),


          )


        ],


      ),

    );
  }
}
