import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_little_green_product_e_com/Responsive/Responsive_Layout.dart';
import 'package:the_little_green_product_e_com/Responsive/Responsive_WebApp.dart';

import 'Responsive_MoblieApp.dart';

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
            return Responsive_Laout(
                mobileApp: Responsive_MobileApp(),
                webApp: Responsive_WebApp()
            );

          }
        },
      ),
    );
  }
}
