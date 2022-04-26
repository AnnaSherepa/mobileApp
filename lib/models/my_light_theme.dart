import 'package:flutter/material.dart';

class MyLightTheme {
  Color mainTextAndItemColor = Colors.black;
  Color mainBackgroundColor = Colors.white;
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
