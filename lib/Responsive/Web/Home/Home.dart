import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:the_little_green_product_e_com/Responsive/Web/NavBar/NavBarDrawer.dart';
import 'package:the_little_green_product_e_com/Responsive/Web/Slider/Slider.dart';
import 'package:the_little_green_product_e_com/View%20All/Recomment_View/Recomment_responsive.dart';
import '../../../View All/Popular_View/Popular_view_responsive.dart';
import '../NavBar/NavBar.dart';
import '../Product/Bast Product/Bast_product_web.dart';
import '../Product/Indoor Product/Indoor_product_web.dart';
import '../Product/Outdoor Product/Outdoor_product_web.dart';
import '../Product/Popular Product/Popular_product_web.dart';
import '../Product/Recomment Product/Recomment_product_web.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context ,size) => Scaffold(
        drawer: size.deviceScreenType == DeviceScreenType.mobile ? NavBarDrawer() : null,
        body: ListView(
          children: [
            NavBar(),
            Slider_bar(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text("Recomment",style: TextStyle(fontSize: 20,fontFamily: "f2",fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      child: GestureDetector(
                        onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> Recomment_viewAll())),
                          child: Text("View all",style: TextStyle(fontSize: 20,fontFamily: "f2",fontWeight: FontWeight.bold),)
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Recomment_web(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text("Popular",style: TextStyle(fontSize: 20,fontFamily: "f2",fontWeight: FontWeight.bold),),
                    ),
                    GestureDetector(
                      onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> Popular_viewAll())),
                      child: Container(
                        child: Text("View all",style: TextStyle(fontSize: 20,fontFamily: "f2",fontWeight: FontWeight.bold),),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Popular_web(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text("Bast",style: TextStyle(fontSize: 20,fontFamily: "f2",fontWeight: FontWeight.bold),),
                    ),
                    GestureDetector(
                      // onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> Recomment_viewAll())),
                      child: Container(
                        child: Text("View all",style: TextStyle(fontSize: 20,fontFamily: "f2",fontWeight: FontWeight.bold),),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Bast_web(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text("Indoor",style: TextStyle(fontSize: 20,fontFamily: "f2",fontWeight: FontWeight.bold),),
                    ),
                    GestureDetector(
                      // onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> Recomment_viewAll())),
                      child: Container(
                        child: Text("View all",style: TextStyle(fontSize: 20,fontFamily: "f2",fontWeight: FontWeight.bold),),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Indoor_web(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text("Outdoor",style: TextStyle(fontSize: 20,fontFamily: "f2",fontWeight: FontWeight.bold),),
                    ),
                    GestureDetector(
                      // onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> Recomment_viewAll())),
                      child: Container(
                        child: Text("View all",style: TextStyle(fontSize: 20,fontFamily: "f2",fontWeight: FontWeight.bold),),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Outdoor_web(),
          ],
        ),
      ),
    );
  }
}
