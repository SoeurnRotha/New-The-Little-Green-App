import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavBar_Tablat extends StatefulWidget {
  const NavBar_Tablat({Key? key}) : super(key: key);

  @override
  State<NavBar_Tablat> createState() => _NavBar_TablatState();
}

class _NavBar_TablatState extends State<NavBar_Tablat> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: Colors.blue,
    );
  }
}
