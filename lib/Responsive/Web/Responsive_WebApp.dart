import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:the_little_green_product_e_com/Responsive/Web/Delivery/Delivery_Web.dart';
import 'package:the_little_green_product_e_com/Responsive/Web/NavBar/NavBar_Web.dart';
import 'package:the_little_green_product_e_com/Responsive/Web/Slider/Slider_Web.dart';
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

        Container(height: 500,),
      ],
    );
  }



}
