import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class About_Us_Page extends StatefulWidget {
  const About_Us_Page({Key? key}) : super(key: key);

  @override
  State<About_Us_Page> createState() => _About_Us_PageState();
}

class _About_Us_PageState extends State<About_Us_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar,
      body: _buildBody,
    );
  }
  get _buildAppbar{
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_rounded,size: 30,color: Colors.black,),
        onPressed: ()=> Navigator.pop(context),
      ),
      centerTitle: true,
      title: Text("About US",style: TextStyle(fontSize: 20,fontFamily: "f1",fontWeight: FontWeight.bold,color: Colors.black),),
      backgroundColor: Colors.white,
    );
  }
  get _buildBody{
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/intro/back.jpg"),
                fit: BoxFit.cover
              )
            ),
          ),
        ],
      ),
    );
  }
}
