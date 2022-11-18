import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'PerferenceTheme.dart';

class ThemeProvider with ChangeNotifier{
  bool _darkTheme =false;




  PerferenceTheme perferenceTheme = PerferenceTheme();
  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    perferenceTheme.setTheme(value);
    notifyListeners();

  }
}