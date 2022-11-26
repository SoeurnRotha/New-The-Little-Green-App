import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_little_green_product_e_com/Responsive/Web/About%20Us/AboutUs_responsive.dart';
import 'package:the_little_green_product_e_com/Responsive/Web/About%20Us/About_Web.dart';

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
                child: InkWell(
                    onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> AboutUs_responsive())),
                    mouseCursor: MaterialStateMouseCursor.clickable,
                    child: Text("About Us", style: TextStyle(fontFamily: "f1",fontWeight: FontWeight.bold,fontSize: 16),)),
              ),
              SizedBox(width: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("016 315 751", style: TextStyle(fontFamily: "f1",fontWeight: FontWeight.bold,fontSize: 20),),
              ),

            ],
          )
        ],
      ),
    );
  }
}
