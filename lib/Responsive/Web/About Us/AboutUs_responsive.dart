import 'package:flutter/cupertino.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:the_little_green_product_e_com/Responsive/Web/About%20Us/AboutUs_Mobile.dart';

class AboutUs_responsive extends StatefulWidget {
  const AboutUs_responsive({Key? key}) : super(key: key);

  @override
  State<AboutUs_responsive> createState() => _AboutUs_responsiveState();
}

class _AboutUs_responsiveState extends State<AboutUs_responsive> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: AboutUs_Mobile(),
      ///
    );
  }
}
