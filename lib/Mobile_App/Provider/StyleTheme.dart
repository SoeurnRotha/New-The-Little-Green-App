import 'package:flutter/material.dart';

class StyleTheme{
  static ThemeData themeData(bool isDarkTheme){
    return ThemeData(
      primaryColor: isDarkTheme ? Colors.black : Colors.white,
      scaffoldBackgroundColor: isDarkTheme ? Colors.white : Colors.white,
    );
  }
}