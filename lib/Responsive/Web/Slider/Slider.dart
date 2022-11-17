import 'package:flutter/cupertino.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:the_little_green_product_e_com/Responsive/Web/Slider/Slider_Mobile.dart';
import 'package:the_little_green_product_e_com/Responsive/Web/Slider/Slider_Tablat.dart';
import 'package:the_little_green_product_e_com/Responsive/Web/Slider/Slider_Web.dart';

class Slider_bar extends StatefulWidget {
  const Slider_bar({Key? key}) : super(key: key);

  @override
  State<Slider_bar> createState() => _Slider_barState();
}

class _Slider_barState extends State<Slider_bar> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: Slider_Mobile(),
      tablet: Slider_Tablat(),
      desktop: Slider_Web(),
    );
  }
}
