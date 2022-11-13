import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Responsive_MobileApp extends StatefulWidget {
  const Responsive_MobileApp({Key? key}) : super(key: key);

  @override
  State<Responsive_MobileApp> createState() => _Responsive_MobileAppState();
}

class _Responsive_MobileAppState extends State<Responsive_MobileApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody,
    );
  }
  get _buildBody{
    return Container(
      color: Colors.purple,
    );
  }
}
