import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavBar_Web extends StatefulWidget {
  const NavBar_Web({Key? key}) : super(key: key);

  @override
  State<NavBar_Web> createState() => _NavBar_WebState();
}

class _NavBar_WebState extends State<NavBar_Web> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: Colors.red,
    );
  }
}
