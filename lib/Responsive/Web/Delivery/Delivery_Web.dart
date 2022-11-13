import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Delivery_Web extends StatefulWidget {
  const Delivery_Web({Key? key}) : super(key: key);

  @override
  State<Delivery_Web> createState() => _Delivery_WebState();
}

class _Delivery_WebState extends State<Delivery_Web> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween ,
        children: [
          Container(
              height: 120,
              width: MediaQuery.of(context).size.width/3,
              color: Colors.grey
          ),
          Container(
            height: 120,
            width: MediaQuery.of(context).size.width/3,
            color: Colors.yellow,
          ),
          Container(
            width: MediaQuery.of(context).size.width/3,
            height: 120,
            color: Colors.lightGreen,
          ),

        ],
      ),
    );
  }
}
