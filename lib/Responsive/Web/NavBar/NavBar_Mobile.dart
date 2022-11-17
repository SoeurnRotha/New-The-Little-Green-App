import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavBar_Mobile extends StatefulWidget {
  const NavBar_Mobile({Key? key}) : super(key: key);

  @override
  State<NavBar_Mobile> createState() => _NavBar_MobileState();
}

class _NavBar_MobileState extends State<NavBar_Mobile> {

  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 3
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: ()=> Scaffold.of(context).openDrawer(),
          ),
          Container(
            child: Text("The Little Green",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: "f1"),),
          )
        ],
      ),
    );
  }
}
