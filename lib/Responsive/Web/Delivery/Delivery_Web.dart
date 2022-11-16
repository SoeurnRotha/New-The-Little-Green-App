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
            width: MediaQuery.of(context).size.width/2,
            height: 100,
            color: Colors.grey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("images/icon/01.png",width: 60,height: 60,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Delivery to 25 Provinces/Cities",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,fontFamily: "f1"),),
                    Text("Delivery-fee is \$1 to \$5 base on destination",style: TextStyle(fontFamily: "f1",fontSize: 18),),
                  ],
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width/2,
            height: 100,
            color: Colors.grey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("images/icon/02.png",width: 60,height: 60,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("ONLINE SUPPORT 24/7",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,fontFamily: "f1"),),
                    Text("We are always ready to help you",style: TextStyle(fontFamily: "f1",fontSize: 18),),
                  ],
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
}
