import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:the_little_green_product_e_com/Responsive/Web/Product/Indoor%20Product/Indoor_Mobile.dart';
import 'package:the_little_green_product_e_com/Responsive/Web/Product/Indoor%20Product/Indoor_Tablat.dart';
import 'package:the_little_green_product_e_com/Responsive/Web/Product/Indoor%20Product/Indoor_Web.dart';

class Indoor_web extends StatefulWidget {
  const Indoor_web({Key? key}) : super(key: key);

  @override
  State<Indoor_web> createState() => _Indoor_webState();
}

class _Indoor_webState extends State<Indoor_web> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: Indoor_Mobile(),
      tablet: Indoor_Tablat(),
      desktop: Indoor_Web(),
    );
  }
}
