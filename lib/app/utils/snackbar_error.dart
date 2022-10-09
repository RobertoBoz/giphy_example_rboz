
import 'package:flutter/material.dart';


class SnackBarSingleton {
  factory SnackBarSingleton() {
    _instance ??= SnackBarSingleton._();
    return _instance!;
  }

  SnackBarSingleton._();

  static SnackBarSingleton? _instance;

  static late BuildContext scanckBarcontext; 
  static late SnackBar snackBar;


  static BuildContext get contextSnackBar => scanckBarcontext;

  static set contextSnackBar(BuildContext context) {
    scanckBarcontext = context;
  }

  



  static void showSnack( String message){

  


    ScaffoldMessenger.of(scanckBarcontext).showSnackBar( SnackBar(
      content: Text(message),
    ),);
  }
}
