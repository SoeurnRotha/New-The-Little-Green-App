import 'package:flutter/cupertino.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:the_little_green_product_e_com/Responsive/Web/Product/Recomment%20Product/Recomment_Mobile.dart';
import 'package:the_little_green_product_e_com/Responsive/Web/Product/Recomment%20Product/Recomment_Tablat.dart';
import 'package:the_little_green_product_e_com/Responsive/Web/Product/Recomment%20Product/Recomment_Web.dart';

class Recomment_web extends StatefulWidget {
  const Recomment_web({Key? key}) : super(key: key);

  @override
  State<Recomment_web> createState() => _Recomment_webState();
}

class _Recomment_webState extends State<Recomment_web> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: Recomment_Mobile(),
      tablet: Recomment_Tablat(),
      desktop: Recomment_Web(),
    );
  }
}
