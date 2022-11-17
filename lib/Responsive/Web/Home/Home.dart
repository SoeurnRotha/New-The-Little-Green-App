import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:the_little_green_product_e_com/Responsive/Web/NavBar/NavBarDrawer.dart';
import 'package:the_little_green_product_e_com/Responsive/Web/Slider/Slider.dart';
import 'package:the_little_green_product_e_com/Responsive/Web/Slider/Slider_Web.dart';

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
          // yk item responsive dak in all
          //
          children: [
            NavBar(),
            Slider_bar(),
            Recomment_web(),
            Popular_web(),
            Bast_web(),
            Indoor_web(),
            Outdoor_web(),
            ///
            ///
            ///
            ///
            ///
            ///
          ],
        ),
      ),
    );
  }
}
