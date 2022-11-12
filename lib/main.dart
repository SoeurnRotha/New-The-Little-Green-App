import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:the_little_green_product_e_com/Provider/Theme_Provider.dart';
import 'package:the_little_green_product_e_com/Welcom%20Screen/Welcome_PageView.dart';
import 'package:the_little_green_product_e_com/screen/home_page.dart';

import 'Login_page/login_page.dart';
import 'package:provider/provider.dart';

import 'Provider/StyleTheme.dart';

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
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }else if(snapshot.hasError){
            return Center(child: Text("Error"),);
          // }else if(snapshot.hasData){
          //   return HomePage();
          }else{
            return Welcome_Page();
          }
        },
      ),
    );
  }
}
