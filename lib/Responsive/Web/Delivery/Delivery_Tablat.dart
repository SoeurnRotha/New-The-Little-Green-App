import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Delivery_Tablat extends StatefulWidget {
  const Delivery_Tablat({Key? key}) : super(key: key);

  @override
  State<Delivery_Tablat> createState() => _Delivery_TablatState();
}

class _Delivery_TablatState extends State<Delivery_Tablat> {
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
