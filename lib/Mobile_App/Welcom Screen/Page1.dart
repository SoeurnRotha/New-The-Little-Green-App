import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  int activeIndex = 0;
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(right: 200),
            width: 250,
            height: 250,
            child: Image.asset("images/Welcome/02.png"),
          ),
          Container(
            // alignment: Alignment.topRight,
            margin: EdgeInsets.only(left: 220),
            width: 250,
            height: 250,
            child: Image.asset("images/Welcome/03.png"),
          ),
          Container(
            margin: EdgeInsets.only(top: 350),
            alignment: Alignment.center,
            child: Image.asset("images/Welcome/04.png"),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(bottom: 100),
            child: Text("WelCome to",style: TextStyle(fontSize: 40,fontFamily: "f2",fontWeight: FontWeight.bold),),
          ),

          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 30),
            child: Text("The Little Green",style: TextStyle(fontSize: 40,fontFamily: "f2",fontWeight: FontWeight.bold),),
          ),




        ],
      ),
    );
  }
}
