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
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center ,
        children: [
          Container(
            width : MediaQuery.of(context).size.width,
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
                    Container(child: Text("Delivery to 25 Provinces/Cities",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,fontFamily: "f1"),)),
                    Container(child: Text("Delivery-fee is \$1 to \$5 base on destination",style: TextStyle(fontFamily: "f1",fontSize: 16),)),
                  ],
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
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
                    Container(child: Text("ONLINE SUPPORT 24/7",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,fontFamily: "f1"),)),
                    Container(child: Text("We are always ready to help you",style: TextStyle(fontFamily: "f1",fontSize: 16,),))
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
