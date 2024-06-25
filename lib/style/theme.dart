import 'package:flutter/material.dart';
//all styles for the UI and text in my app are defined here

enum AppThemeMode {Light, Dark}

class AppTheme{
  static const Color primaryColor = Color.fromARGB(255, 71, 47, 47);
  static const Color accentColor = Color.fromARGB(255, 165, 190, 176);
  static const Color backgroundColor = Color.fromARGB(255, 241, 232, 206);
  static const Color darkBackgroundColor = Color.fromARGB(255, 36, 36, 36);

  static const TextStyle headline1 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: primaryColor,
  );
  

  static const TextStyle bodyText1 = TextStyle(
    fontSize: 15,
    color: primaryColor,
  );

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: primaryColor,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: accentColor,
        background: darkBackgroundColor,
        brightness: Brightness.dark
        ), 
      textTheme: TextTheme(
        displayLarge: headline1,
        bodyLarge: bodyText1.copyWith(color: Colors.white),
      ), 
      scaffoldBackgroundColor: darkBackgroundColor
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: primaryColor,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: accentColor,
        background: backgroundColor,
        brightness: Brightness.light
      ),
      textTheme: TextTheme(
        displayLarge: headline1,
        bodyLarge: bodyText1
      ), 
      scaffoldBackgroundColor: backgroundColor
    );
  }

  static ThemeData getThemeData(AppThemeMode mode){
    switch(mode){
      case AppThemeMode.Light:
        return lightTheme;
      case AppThemeMode.Dark:
        return darkTheme;
      default:
        return lightTheme;
    }
  }
}