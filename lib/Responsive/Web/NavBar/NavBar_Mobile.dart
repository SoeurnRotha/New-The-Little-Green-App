import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavBar_Mobile extends StatefulWidget {
  const NavBar_Mobile({Key? key}) : super(key: key);

  @override
  State<NavBar_Mobile> createState() => _NavBar_MobileState();
}

class _NavBar_MobileState extends State<NavBar_Mobile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: Colors.purple,
    );
  }
}
