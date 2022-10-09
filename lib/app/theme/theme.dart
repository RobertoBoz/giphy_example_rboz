
import 'package:flutter/material.dart';

class ThemeApp {

  static ThemeData getTheme(){
    return ThemeData(
      useMaterial3: true,
      appBarTheme: const  AppBarTheme(centerTitle: true,backgroundColor:  Color(0xffE5E5E5)),
      buttonTheme:const  ButtonThemeData(
        buttonColor: Colors.red,
      ),
      backgroundColor: const Color(0xffE5E5E5),
      scaffoldBackgroundColor: const Color(0xffE5E5E5),
      inputDecorationTheme: const InputDecorationTheme(                    
          hintStyle:  TextStyle(
            color: Color(0xffAFB4BC),
            fontSize: 14,
          ),       
          filled: true,     
          enabledBorder: OutlineInputBorder( //Outline border type for TextFeild
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(
                color:Color(0xfff4f7fb),                
              ),
          ),
          disabledBorder: OutlineInputBorder( //Outline border type for TextFeild
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(
                color:Color(0xfff4f7fb),                
              ),
          ),
          focusedBorder: OutlineInputBorder( //Outline border type for TextFeild
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(
                color:Color(0xfff4f7fb),                
              ),
          ),
          fillColor: Color(0xfff4f7fb),
          focusColor:  Color(0xfff4f7fb),
          hoverColor:  Color(0xfff4f7fb),
      ),
    );
    
  }

}
