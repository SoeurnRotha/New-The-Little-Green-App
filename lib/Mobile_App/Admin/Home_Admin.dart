import 'package:flutter/material.dart';


import 'Detail_Page/Bast.dart';
import 'Detail_Page/Indoor.dart';
import 'Detail_Page/Outdoor.dart';
import 'Detail_Page/Popular_Admin.dart';
import 'Detail_Page/Poster_Slider.dart';
import 'Detail_Page/Recomment.dart';
import 'admin_helper/login_helper.dart';
class Admin_Home extends StatefulWidget {
  const Admin_Home({Key? key}) : super(key: key);

  @override
  State<Admin_Home> createState() => _Admin_HomeState();
}

class _Admin_HomeState extends State<Admin_Home> {
  AuthHelper _authHelper = AuthHelper();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Admin Home", style: TextStyle(fontSize: 20, fontFamily: "f1", color: Colors.black, fontWeight: FontWeight.bold),),
          backgroundColor: Colors.white,
          leading: Builder(builder: (context) =>  IconButton(
            icon: Icon(Icons.menu, color: Colors.black,),
            onPressed: (){
              Scaffold.of(context).openDrawer();
            },
          ),)
        ),
        body: _buildBody(),
        drawer: _builDrawer(),
      ),
    );
  }
  Widget _builDrawer(){
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            title: Text("Logout", style: TextStyle(fontSize: 20, fontFamily: "f1", color: Colors.red),),
            leading: Icon(Icons.logout, size: 30, color: Colors.red,),
            onTap: (){
              _authHelper.logout(context);
            },
          ),
        ],
      ),
    );
  }
  Widget _buildBody(){
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        InkWell(
          child: _buildBox("images/admin/01.jpg","Poster Slider Products"),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Poster_Slider()));
          },
        ),

        InkWell(child: _buildBox("images/admin/02.jpg","Recomment Products"), onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> Recomments_Admin())),),
        InkWell(child: _buildBox("images/admin/03.jpg","Bast Products"), onTap: ()=>  Navigator.push(context, MaterialPageRoute(builder: (context)=> Bast())),),
        InkWell(child: _buildBox("images/admin/04.jpg","Popular Products"), onTap: ()=>  Navigator.push(context, MaterialPageRoute(builder: (context)=> Popular(),))),
        InkWell(child: _buildBox("images/admin/05.jpg","Indoor Products"), onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> Indoor()),)),
        InkWell(child: _buildBox("images/admin/06.jpg","Outdoor Products"), onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> Outdoor(),))),
      ],
    );
  }


  Widget _buildBox(String img, String name){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey,
              image: DecorationImage(
                image: AssetImage(img),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 1,
                  blurRadius: 5,
                  blurStyle: BlurStyle.outer
                ),

              ]
            ),
        child: Center(
          child: Text(name,style: TextStyle(fontFamily: "f1",fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
        ),

      ),
    );
  }
}
