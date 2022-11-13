import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Delivery_Mobile extends StatefulWidget {
  const Delivery_Mobile({Key? key}) : super(key: key);

  @override
  State<Delivery_Mobile> createState() => _Delivery_MobileState();
}

class _Delivery_MobileState extends State<Delivery_Mobile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
            height: 120,
            color: Colors.grey
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 120,
            color: Colors.yellow,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 120,
            color: Colors.lightGreen,
          ),

        ],
      ),
    );
  }
}
