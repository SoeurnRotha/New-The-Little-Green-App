import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:the_little_green_product_e_com/Responsive/Web/NavBar/NavBar_Mobile.dart';
import 'package:the_little_green_product_e_com/Responsive/Web/Slider/Slider_Mobile.dart';

import 'Delivery/Delivery_Mobile.dart';
import 'Product/Bast Product/Bast_Mobile.dart';
import 'Product/Discount Products/Discount_Mobile.dart';
import 'Product/Indoor Product/Indoor_Mobile.dart';
import 'Product/Outdoor Product/Outdoor_Mobile.dart';
import 'Product/Popular Product/Popular_Mobile.dart';
import 'Product/Recomment Product/Recomment_Mobile.dart';
class Responsive_MobileApp extends StatefulWidget {
  const Responsive_MobileApp({Key? key}) : super(key: key);

  @override
  State<Responsive_MobileApp> createState() => _Responsive_MobileAppState();
}

class _Responsive_MobileAppState extends State<Responsive_MobileApp> {
  int _sliderindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(),
      body: _buildBody,
    );
  }
  get _buildBody{
    return ListView(
      children: [
        // NavBar_Mobile(),
        SizedBox(height: 10,),
        Slider_Mobile(),
        SizedBox(height: 10,),
        Delivery_Mobile(),
        SizedBox(height: 20,),
        _buildPanal("Discount"),
        Discount_Mobile(),
        _buildPanal("Recomment"),
        Recomment_Mobile(),
        _buildPanal("Popular"),
        Popular_Mobile(),
        _buildPanal("Bast"),
        Bast_Mobile(),
        _buildPanal("Indoor"),
        Indoor_Mobile(),
        _buildPanal("Outdoor"),
        Outdoor_Mobile(),

        Container(height: 500,)

      ],
    );
  }

  Widget _buildPanal(String text){
    return Container(
      margin: EdgeInsets.only(left: 20),
      height: 50,

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(text, style: TextStyle(fontSize: 35,fontFamily: "f2",fontWeight: FontWeight.bold),),
      ),

    );
  }



}
