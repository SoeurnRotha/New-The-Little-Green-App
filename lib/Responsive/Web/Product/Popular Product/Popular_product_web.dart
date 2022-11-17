import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:the_little_green_product_e_com/Responsive/Web/Product/Popular%20Product/Popular_Mobile.dart';
import 'package:the_little_green_product_e_com/Responsive/Web/Product/Popular%20Product/Popular_Tablat.dart';

import 'Popular_Web.dart';

class Popular_web extends StatefulWidget {
  const Popular_web({Key? key}) : super(key: key);

  @override
  State<Popular_web> createState() => _Popular_webState();
}

class _Popular_webState extends State<Popular_web> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: Popular_Mobile(),
      tablet: Popular_Tablat(),
      desktop: Popular_Web(),
    );
  }
}
