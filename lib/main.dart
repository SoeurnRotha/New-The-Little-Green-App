
import 'dart:js_util';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:the_little_green_product_e_com/Responsive/MobileApp.dart';

import 'package:the_little_green_product_e_com/Responsive/WebApp.dart';

import 'package:provider/provider.dart';

import 'Mobile_App/Provider/StyleTheme.dart';
import 'Mobile_App/Provider/Theme_Provider.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB8Yw7f0P_cl7oTFFYETTKKLv1OHbPrB_I",
            authDomain: "the-little-green-e-commerce.firebaseapp.com",
            projectId: "the-little-green-e-commerce",
            storageBucket: "the-little-green-e-commerce.appspot.com",
            messagingSenderId: "548642117402",
            appId: "1:548642117402:web:d296b2c3a9aec403007ea3",
            measurementId: "G-QE9D1YSSGZ"
        )
    );
  }else{
    await Firebase.initializeApp();
  }


  runApp(TheLittleGreenApp());
}
class TheLittleGreenApp extends StatefulWidget {
  const TheLittleGreenApp({Key? key}) : super(key: key);

  @override
  State<TheLittleGreenApp> createState() => _TheLittleGreenAppState();
}

class _TheLittleGreenAppState extends State<TheLittleGreenApp> {
  ThemeProvider themeProvider = ThemeProvider();


  void getCurrentTheme() async{
    themeProvider.darkTheme = await themeProvider.perferenceTheme.getTheme();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentTheme();
  }
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (_) => themeProvider,
      child: Consumer<ThemeProvider>(
        builder: (context,valye,child){
          return MaterialApp(
            theme: StyleTheme.themeData(themeProvider.darkTheme),
            debugShowCheckedModeBanner: false,
            home: _buildScaffold,

          );
        },
      ),
    );
  }
  get _buildScaffold{
    return Scaffold(
      body: kIsWeb ? WebApp() : MobileApp()
    );
  }

}
