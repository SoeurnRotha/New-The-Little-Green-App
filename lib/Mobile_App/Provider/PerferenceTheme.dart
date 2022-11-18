import 'package:shared_preferences/shared_preferences.dart';
class PerferenceTheme {
   static const THEME_STATIC = "THEME_STATIC";

   void setTheme(bool value) async{
     SharedPreferences preferences =await SharedPreferences.getInstance();
     preferences.setBool(THEME_STATIC, value);

   }

   Future<bool> getTheme() async{
     SharedPreferences preferences = await SharedPreferences.getInstance();
     return preferences.getBool(THEME_STATIC) ?? false;
   }
}