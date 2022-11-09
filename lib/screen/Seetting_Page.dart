import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SeettingPage extends StatefulWidget {
  const SeettingPage({Key? key}) : super(key: key);

  @override
  State<SeettingPage> createState() => _SeettingPageState();
}

class _SeettingPageState extends State<SeettingPage> {
  @override
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
      body: _buildBody,
    );
  }
  get _buildBody{
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.nightlight),
            title: Text("Theme",style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "f1",fontSize: 18),),
          ),

        ],
      ),
    );
  }
}
