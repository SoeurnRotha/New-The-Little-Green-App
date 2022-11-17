import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:the_little_green_product_e_com/Responsive/Web/About%20Us/AboutUs_Mobile.dart';
import 'package:the_little_green_product_e_com/Responsive/Web/Home/Home.dart';

class AppRouter {
  GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', pageBuilder: (context, state){
        return MaterialPage(child: Home());
      }),
      GoRoute(path: 'app', pageBuilder: (context, state){
        return MaterialPage(child: AboutUs_Mobile());
      }),
      GoRoute(path: 'about', pageBuilder: (context, state){
        return MaterialPage(child: AboutUs_Mobile());
      }),
      GoRoute(path: 'contacte', pageBuilder: (context, state){
        return MaterialPage(child: AboutUs_Mobile());
      }),
    ]
  );
}