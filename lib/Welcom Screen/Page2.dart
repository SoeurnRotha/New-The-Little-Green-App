import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_little_green_product_e_com/Login_page/login_page.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(

            width: 300,
            height: 300,
            child: Image.asset("images/Welcome/06.png"),
          ),
          Container(
            child: Text("Enjoy your",style: TextStyle(fontFamily: "f2",fontSize: 30),),
          ),
          Container(
            child: Text("Life with Plant",style: TextStyle(fontFamily: "f2",fontSize: 30),),
          ),
          SizedBox(height: 10,),
          ElevatedButton(
            onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage()));
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.purple,
              fixedSize: Size(150, 50),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
            ),
            child: Text("Sign In",style: TextStyle(fontSize: 20,fontFamily: "f2",),),
          )
        ],
      ),
    );
  }
}
