import 'package:flutter/material.dart';
import 'dart:convert';
import 'http_exeception.dart';

import 'package:http/http.dart' as http;

class Authentication with ChangeNotifier{

  Future<void> signUp(String email,String password) async{


    const url = 'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCkZC_QHvAGsOIOQFIYhBZ_9M_HFSk00Uc';



    try{

      final response = await http.post(url,body: json.encode(
          {
            'email' : email,
            'password' : password,
            'returnSecureToken' : true,

          }
      ));

      final responseData = json.decode(response.body);
      if(responseData['error'] != null)
      {
        throw HttpException(responseData['error']['message']);
      }

    }catch(error)
    {
      throw error;
    }


  }




  Future<void> logIn(String email,String password) async{


    const url = 'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyCkZC_QHvAGsOIOQFIYhBZ_9M_HFSk00Uc';

    try{

      final response = await http.post(url,body: json.encode(
          {
            'email' : email,
            'password' : password,
            'returnSecureToken' : true,

          }
      ));

      final responseData = json.decode(response.body);
      if(responseData['error'] != null)
        {
          throw HttpException(responseData['error']['message']);
        }

    }catch(error)
    {
      throw error;
    }


  }
}