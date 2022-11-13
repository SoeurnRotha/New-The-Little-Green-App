import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Slider_Mobile extends StatefulWidget {
  const Slider_Mobile({Key? key}) : super(key: key);

  @override
  State<Slider_Mobile> createState() => _Slider_MobileState();
}

class _Slider_MobileState extends State<Slider_Mobile> {
  int _sliderindex=0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
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
                height: 200,
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
