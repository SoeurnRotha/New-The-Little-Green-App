import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_little_green_product_e_com/Provider/Theme_Provider.dart';

class SeettingPage extends StatefulWidget {
  const SeettingPage({Key? key}) : super(key: key);

  @override
  State<SeettingPage> createState() => _SeettingPageState();
}

class _SeettingPageState extends State<SeettingPage> {
  ThemeProvider themeProvider = ThemeProvider();
  @override

  bool _darkTheme = false;
  final _bucket= PageStorageBucket();



  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Seetting",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: "f2",color: Colors.black),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded,size: 30,color: Colors.black,),
          onPressed: ()=> Navigator.pop(context),
        ),
      ),
      body: PageStorage(
        bucket: _bucket,
        child: _buildBody,
      ),
    );
  }
  get _buildBody{
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ListView(
        key: PageStorageKey<String> ("Seetting"),
        children: [
          ListTile(
            leading: Icon(Icons.nightlight),
            title: Text("Theme",style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "f1",fontSize: 18),),
            trailing:  Switch(
              value: _darkTheme , onChanged: (state){
                themeProvider.darkTheme = !themeProvider.darkTheme;
                setState(() {
                  _darkTheme = state;
                });
            },
            ),
          ),
        ],
      ),
    );
  }
}
