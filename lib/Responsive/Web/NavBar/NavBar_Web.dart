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
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 1
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("The Little Green", style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,fontFamily: "f1"),),
          Row(

            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Home", style: TextStyle(fontFamily: "f1",fontWeight: FontWeight.bold,fontSize: 20),),
              ),
              SizedBox(width: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("App", style: TextStyle(fontFamily: "f1",fontWeight: FontWeight.bold,fontSize: 20),),
              ),
              SizedBox(width: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("About Us", style: TextStyle(fontFamily: "f1",fontWeight: FontWeight.bold,fontSize: 20),),
              ),
              SizedBox(width: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Contacte", style: TextStyle(fontFamily: "f1",fontWeight: FontWeight.bold,fontSize: 20),),
              ),
              SizedBox(width: 20,),
            ],
          )
        ],
      ),
    );
  }
}
