import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Custom_Scrool.dart';
class Popular_Web extends StatefulWidget {
  const Popular_Web({Key? key}) : super(key: key);

  @override
  State<Popular_Web> createState() => _Popular_WebState();
}

class _Popular_WebState extends State<Popular_Web> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 350,
      color: Colors.grey,
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildItemListView,
                _buildItemListView,
                _buildItemListView,
                _buildItemListView,
                _buildItemListView,
                _buildItemListView,
                _buildItemListView,
                _buildItemListView,
                _buildItemListView,
              ],
            ),
          )
      ),
    );
  }

  get _buildItemListView{
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.yellow,
            ),
          ),
          SizedBox(height: 10,),
          Container(
            width: 200,
            child: Text("HyperX Pulsefire Haste Wireless Gaming Mouse (White) ",style: TextStyle(fontFamily: "f2",fontSize: 15),),
          ),
          SizedBox(height: 10,),
          Container(
            child: Text("90.99\$",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: "f1"),),
          )
        ],
      ),
    );
  }
}
