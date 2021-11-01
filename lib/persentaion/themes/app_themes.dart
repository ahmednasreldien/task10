import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    tabBarTheme: const TabBarTheme(
      labelColor: Colors.black,
      labelStyle:TextStyle(
        fontSize: 15,
      ),
      // indicator: BoxDecoration(
      //   border: Border(top: 2)
      // )
    
    ),
    primarySwatch: Colors.deepPurple,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: Colors.red,
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[200],
      centerTitle: true,
      iconTheme: IconThemeData(color:Colors.black),
      titleTextStyle:
      
          const TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.black),
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(fontSize: 14),
      bodyText2: TextStyle(
        fontSize: 18,
      ),
      headline6: TextStyle(
        fontSize: 28,
      ),
    ),
  );
}
