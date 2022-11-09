import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:the_little_green_product_e_com/screen/home_page.dart';

import 'Login_page/login_page.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(TheLittleGreenApp());
}
class TheLittleGreenApp extends StatefulWidget {
  const TheLittleGreenApp({Key? key}) : super(key: key);

  @override
  State<TheLittleGreenApp> createState() => _TheLittleGreenAppState();
}

class _TheLittleGreenAppState extends State<TheLittleGreenApp> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: _buildScaffold,


    );
  }
  get _buildScaffold{
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }else if(snapshot.hasError){
            return Center(child: Text("Error"),);
          }else if(snapshot.hasData){
            return HomePage();
          }else{
            return LoginPage();
          }
        },
      ),
    );
  }
}
