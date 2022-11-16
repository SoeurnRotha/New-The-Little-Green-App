import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:the_little_green_product_e_com/Responsive/Web/Delivery/Delivery_Web.dart';
import 'package:the_little_green_product_e_com/Responsive/Web/NavBar/NavBar_Web.dart';
import 'package:the_little_green_product_e_com/Responsive/Web/Product/Discount%20Products/Discount_Web.dart';
import 'package:the_little_green_product_e_com/Responsive/Web/Slider/Slider_Web.dart';

import 'Product/Bast Product/Bast_Web.dart';
import 'Product/Indoor Product/Indoor_Web.dart';
import 'Product/Outdoor Product/Outdoor_Web.dart';
import 'Product/Popular Product/Popular_Web.dart';
import 'Product/Recomment Product/Recomment_Web.dart';
class Responsive_WebApp extends StatefulWidget {
  const Responsive_WebApp({Key? key}) : super(key: key);

  @override
  State<Responsive_WebApp> createState() => _Responsive_WebAppState();
}

class _Responsive_WebAppState extends State<Responsive_WebApp> {
  int _sliderindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody,
    );
  }
  get _buildBody{
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        // _buildNavBar,
        NavBar_Web(),
        Slider_Web(),
        SizedBox(height: 10,),
        Delivery_Web(),
        // _buildPanal("Discount"),
        // Discount_Web(),
        _buildPanal("Recomment"),
        Recomment_Web(),
        _buildPanal("Popular"),
        Popular_Web(),
        _buildPanal("Bast"),
        Bast_Web(),
        _buildPanal("Indoor"),
        Indoor_Web(),
        _buildPanal("Outdoor"),
        Outdoor_Web(),

        Container(height: 500,),
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
