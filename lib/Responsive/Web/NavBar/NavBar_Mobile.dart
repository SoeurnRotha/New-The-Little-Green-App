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
      color: Colors.purple,
      child: IconButton(
        icon: Icon(Icons.menu),
        onPressed: ()=> scaffoldKey.currentState?.openDrawer(),
      ),
    );
  }
}
