import 'package:fluttertoast/fluttertoast.dart';
import 'authentication.dart';
import 'package:flutter/material.dart';
import 'loginscreen.dart';
import 'package:provider/provider.dart';
import 'selection.dart';
import 'admin.dart';

class signupScreen extends StatefulWidget {
  static const routeName ='/signup';
  @override
  _signupScreenState createState() => _signupScreenState();
}

class _signupScreenState extends State<signupScreen> {
  bool signup;

  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _passController = new TextEditingController();

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
      signup=true;

      await Provider.of<Authentication>(context,listen: false).signUp(_authdata['email'],_authdata['password']);

      if(signup=true)
        Navigator.push(context, MaterialPageRoute(builder: (context)=>MyFlutter()));



    }catch(error)
    {
      signup=false;
      var errorMessage = 'Authentication failed try again';
      _showErrorDialog(errorMessage);

      print('error');
      if(signup=false)
        print('signup failed');




    }





  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('signup page'),




        actions: [
          FlatButton(

            child: Row(
              children: [
                Text('login'),
                Icon(Icons.person_add),



              ],

            ),
            onPressed: (){
              Navigator.of(context).pushReplacementNamed(loginScreen.routeName);
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
                      Colors.lightGreen,
                      Colors.lime,


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
                        controller: _passController,

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


                      TextFormField(
                        decoration: InputDecoration(labelText: 'confirm password'),
                        obscureText: true,

                        validator: (value){
                          if(value.isEmpty || value !=_passController.text){
                            return 'invalid password';
                          }
                          return null;
                        },
                        onSaved: (value){
                          _authdata['password'] = value;

                        },



                      ),






                      RaisedButton(

                        child:Text('signup'),
                        onPressed: (){
                          submit();

                        },

                      )


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
