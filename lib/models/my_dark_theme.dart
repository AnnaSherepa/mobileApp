import 'package:flutter/material.dart';

class MyDarkTheme {
  Color mainTextAndItemColor = Colors.white;
  Color mainBackgroundColor = Colors.black;
  ThemeData getTheme() {
    return ThemeData(
      splashColor: mainTextAndItemColor,
      textTheme: TextTheme(
        caption: TextStyle(color: mainTextAndItemColor),
        bodyText1: TextStyle(color: mainTextAndItemColor),
      ),
      backgroundColor: mainBackgroundColor,
      scaffoldBackgroundColor: mainBackgroundColor,
      bottomAppBarColor: mainBackgroundColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: mainBackgroundColor,
        unselectedItemColor: mainTextAndItemColor,
        selectedItemColor: Colors.grey,
      ),
    );
  }
}
