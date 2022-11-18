import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../Mobile_App/helper/slider_product_helper.dart';
import '../../../Mobile_App/model/Sllider_product_model.dart';

class Slider_Web extends StatefulWidget {
  const Slider_Web({Key? key}) : super(key: key);

  @override
  State<Slider_Web> createState() => _Slider_WebState();
}

class _Slider_WebState extends State<Slider_Web> {
  int _sliderindex = 0;
  SliderHelper _sliderHelper = SliderHelper();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      child: _buildStream,
    );
  }

  get _buildStream {
    return StreamBuilder<QuerySnapshot>(
      stream: _sliderHelper.read(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Error");
        } else if (snapshot.hasData) {
          return _buildList(snapshot.data!.docs);
        } else {
          //loadding

          return Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }

  Widget _buildList(List<DocumentSnapshot> documents) {
    List<SliderProductModel> sliderList = documents.map((data) =>
        SliderProductModel.fromSnapshot(data)).toList();
    CarouselController buttonCarouselController = CarouselController();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CarouselSlider.builder(
          itemCount: sliderList.length,
          itemBuilder: (context, index, nextpage) {
            return _items(sliderList[index]);
          },
          options: CarouselOptions(
              height: 700,
              // enlargeCenterPage: true,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 4),
              autoPlayCurve: Curves.fastOutSlowIn,
              // autoPlayAnimationDuration: Duration(milliseconds: 1000),
              viewportFraction: 0.95,
              aspectRatio: 16 / 9,
              onPageChanged: (index, reson) {
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
            count: sliderList.length,
            effect: ExpandingDotsEffect(
                activeDotColor: Colors.purple,
                dotColor: Colors.grey,
                dotHeight: 20,
                dotWidth: 20
            ),
          ),
        ),
      ],
    );
  }

  Widget _items(SliderProductModel items) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,

        height: 800,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(items.image),
              fit: BoxFit.cover,
            ),
          color: Colors.grey
        ),
      ),
    );
  }
}
