import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:the_little_green_product_e_com/Responsive/Web/Product/Outdoor%20Product/Outdoor_Mobile.dart';
import 'package:the_little_green_product_e_com/Responsive/Web/Product/Outdoor%20Product/Outdoor_Tablat.dart';

import 'Outdoor_Web.dart';

class Outdoor_web extends StatefulWidget {
  const Outdoor_web({Key? key}) : super(key: key);

  @override
  State<Outdoor_web> createState() => _Outdoor_wevState();
}

class _Outdoor_wevState extends State<Outdoor_web> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: Outdoor_Mobile(),
      tablet: Outdoor_Tablat(),
      desktop: Outdoor_Web(),
    );
  }
}
