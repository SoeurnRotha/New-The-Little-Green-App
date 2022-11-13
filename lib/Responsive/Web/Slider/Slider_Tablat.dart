import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Slider_Tablat extends StatefulWidget {
  const Slider_Tablat({Key? key}) : super(key: key);

  @override
  State<Slider_Tablat> createState() => _Slider_TablatState();
}

class _Slider_TablatState extends State<Slider_Tablat> {
  int _sliderindex=0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CarouselSlider(
            items: [
              Container(
                color: Colors.purple,
              ),
              Container(
                color: Colors.yellow,
              ),
              Container(
                color: Colors.red,
              ),
            ],
            options: CarouselOptions(
                height: 400,
                // enlargeCenterPage: true,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 4),
                autoPlayCurve : Curves.fastOutSlowIn,
                // autoPlayAnimationDuration: Duration(milliseconds: 1000),
                viewportFraction: 0.95,
                aspectRatio: 16/9,
                onPageChanged: (index ,reson ){
                  setState(() {
                    _sliderindex = index;
                  });
                }
            ),

          ),

          Container(
            height: 30,
            alignment: Alignment.center,
            child: AnimatedSmoothIndicator(
              activeIndex: _sliderindex,
              count: 3,
              effect: ExpandingDotsEffect(
                  activeDotColor: Colors.purple,
                  dotColor: Colors.grey,
                  dotHeight: 20,
                  dotWidth: 20
              ),
            ),
          ),

        ],
      ),
    );
  }
}
