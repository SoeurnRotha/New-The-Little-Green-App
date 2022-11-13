import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:the_little_green_product_e_com/Responsive/Web/Responsive_WebApp.dart';

import 'Web/Responsive_MoblieApp.dart';
import 'Web/Responsive_TebletApp.dart';

class WebApp extends StatefulWidget {
  const WebApp({Key? key}) : super(key: key);

  @override
  State<WebApp> createState() => _WebAppState();
}

class _WebAppState extends State<WebApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody,
    );
  }
  get _buildBody{
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }else if(snapshot.hasError){
            return Center(child: Text("Error"),);

            }else if(snapshot.hasData){
              return Container(color: Colors.purple,);
          }else{
            return ScreenTypeLayout(
              mobile: Responsive_MobileApp(),
              tablet: Responsive_TablatApp(),
              desktop: Responsive_WebApp(),
            );

          }
        },
      ),
    );
  }
}
