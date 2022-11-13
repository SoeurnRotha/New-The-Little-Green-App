import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Slider_Web extends StatefulWidget {
  const Slider_Web({Key? key}) : super(key: key);

  @override
  State<Slider_Web> createState() => _Slider_WebState();
}

class _Slider_WebState extends State<Slider_Web> {
  int _sliderindex=0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
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
                height: 560,
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
          SizedBox(height: 10,),
          Container(
            height: 20,
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
