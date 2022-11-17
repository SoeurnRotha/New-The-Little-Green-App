import 'package:flutter/cupertino.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:the_little_green_product_e_com/Responsive/Web/Slider/Slider_Mobile.dart';
import 'package:the_little_green_product_e_com/Responsive/Web/Slider/Slider_Tablat.dart';
import 'package:the_little_green_product_e_com/Responsive/Web/Slider/Slider_Web.dart';

class Slider extends StatefulWidget {
  const Slider({Key? key}) : super(key: key);

  @override
  State<Slider> createState() => _SliderState();
}

class _SliderState extends State<Slider> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: Slider_Mobile(),
      tablet: Slider_Tablat(),
      desktop: Slider_Web(),
    );
  }
}
