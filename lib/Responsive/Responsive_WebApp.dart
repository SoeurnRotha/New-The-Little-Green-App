import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Responsive_WebApp extends StatefulWidget {
  const Responsive_WebApp({Key? key}) : super(key: key);

  @override
  State<Responsive_WebApp> createState() => _Responsive_WebAppState();
}

class _Responsive_WebAppState extends State<Responsive_WebApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody,
    );
  }
  get _buildBody{
    return Container(
      color: Colors.blue,
    );
  }
}
