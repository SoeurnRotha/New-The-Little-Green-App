import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:the_little_green_product_e_com/Responsive/Web/NavBar/NavBar_Tablat.dart';
import 'package:the_little_green_product_e_com/Responsive/Web/Product/Discount%20Products/Discount_Tablat.dart';
import 'package:the_little_green_product_e_com/Responsive/Web/Slider/Slider_Tablat.dart';

import 'Delivery/Delivery_Tablat.dart';
import 'Product/Bast Product/Bast_Tablat.dart';
import 'Product/Indoor Product/Indoor_Tablat.dart';
import 'Product/Outdoor Product/Outdoor_Tablat.dart';
import 'Product/Popular Product/Popular_Tablat.dart';
import 'Product/Recomment Product/Recomment_Tablat.dart';
class Responsive_TablatApp extends StatefulWidget {
  const Responsive_TablatApp({Key? key}) : super(key: key);

  @override
  State<Responsive_TablatApp> createState() => _Responsive_TablatAppState();
}

class _Responsive_TablatAppState extends State<Responsive_TablatApp> {
  int _sliderindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody,
    );
  }
  get _buildBody{
    return ListView(
      children: [
        NavBar_Tablat(),
        Slider_Tablat(),
        SizedBox(height: 10,),
        Delivery_Tablat(),
        Discount_Tablat(),
        Recomment_Tablat(),
        Popular_Tablat(),
        Bast_Tablat(),
        Indoor_Tablat(),
        Outdoor_Tablat(),

      ],
    );
  }
}
