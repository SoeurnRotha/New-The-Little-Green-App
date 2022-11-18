import 'package:flutter/cupertino.dart';

class Navigator_server {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigatorTo(String roterName){
    return navigatorKey.currentState!.pushNamed(roterName);


  }

  // bool goBack(){
  //   return navigatorKey.currentState.pop();
  // }


}