import 'package:flutter/material.dart';

class CustomAppThemeData {
  static ThemeData themeData = ThemeData(
    iconTheme: IconThemeData(color: Colors.white),
    appBarTheme: appBarTheme,
    primarySwatch: Colors.orange,
    inputDecorationTheme: inputDecorationTheme,
  );

  static AppBarTheme appBarTheme = const AppBarTheme(
      elevation: 3,
      centerTitle: true,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 24));

  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
    fillColor: Colors.grey[200],
    filled: true,
    border: toMakeBorderNone,
    focusedBorder: toMakeBorderNone,
    enabledBorder: toMakeBorderNone,
  );

  static InputBorder toMakeBorderNone = const OutlineInputBorder(
      borderSide: BorderSide(width: 0, style: BorderStyle.none),
      borderRadius: BorderRadius.all(Radius.circular(12)));
}
