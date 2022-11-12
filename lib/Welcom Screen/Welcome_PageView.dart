import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:the_little_green_product_e_com/Welcom%20Screen/Page1.dart';
import 'package:the_little_green_product_e_com/Welcom%20Screen/Page2.dart';

class Welcome_Page extends StatefulWidget {
  const Welcome_Page({Key? key}) : super(key: key);

  @override
  State<Welcome_Page> createState() => _Welcome_PageState();
}

class _Welcome_PageState extends State<Welcome_Page> {
  PageController pageController = PageController();
  @override

  int activeIndex =0;
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          onPageChanged: (index){

            setState(() {
              activeIndex = index;
            });
          },
          controller: pageController,
        children: [
            Page1(),
            Page2()
        ],
        ),
        Container(
          margin: EdgeInsets.only(top: 520),
          alignment: Alignment.center,
          child: AnimatedSmoothIndicator(
            activeIndex: activeIndex,
            count: 2,
            effect: ExpandingDotsEffect(
                activeDotColor: Colors.purple,
                dotColor: Colors.grey,
                dotHeight: 20,
                dotWidth: 20
            ),
          ),
        )
      ],
    );
  }
}
