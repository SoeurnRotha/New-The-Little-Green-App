import 'package:flutter/cupertino.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../NavBar/NavBar.dart';
import '../Product/Bast Product/Bast_product_web.dart';
import '../Product/Indoor Product/Indoor_product_web.dart';
import '../Product/Outdoor Product/Outdoor_product_web.dart';
import '../Product/Popular Product/Popular_product_web.dart';
import '../Product/Recomment Product/Recomment_product_web.dart';
import '../Responsive_MoblieApp.dart';
import '../Responsive_TebletApp.dart';
import '../Responsive_WebApp.dart';
import '../Slider/Slider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      // yk item responsive dak in all
      //
      children: [
        NavBar(),
        Slider(),
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
    );
  }
}
