import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../helper/slider_product_helper.dart';
import '../model/Sllider_product_model.dart';

class SliderStream extends StatefulWidget {
  const SliderStream({Key? key}) : super(key: key);

  @override
  State<SliderStream> createState() => _SliderStreamState();
}

class _SliderStreamState extends State<SliderStream> {
  SliderHelper sliderHelper = SliderHelper();
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
        child: _buildStreamBulider
    );
  }
  Widget get _buildStreamBulider{
    return StreamBuilder<QuerySnapshot>(
        stream: sliderHelper.read(),
        builder: (context , snapshot){
          if(snapshot.hasError){
            return Text("Error");
          }else{
            if(snapshot.hasData){
              return _buildListView(snapshot.data!.docs);
            }else{
              return  Center(child: CircularProgressIndicator(),);
            }

          }
        }
    );
  }
  Widget _buildListView(List<DocumentSnapshot> documents){
    List<SliderProductModel> sliderList = documents.map((data) => SliderProductModel.fromSnapshot(data)).toList();
    CarouselController buttonCarouselController = CarouselController();


    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: buttonCarouselController,
            itemCount: sliderList.length,
            itemBuilder: (context, index, nextpage){
              return _items(sliderList[index]);
            },
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 16/9,
              height: 250,
              viewportFraction: 0.8,
              autoPlayInterval: Duration(seconds: 2),
              autoPlayAnimationDuration: Duration(seconds: 1),
              onPageChanged: (index , reason){
                setState((){
                  activeIndex = index;
                });
              }
            ),

        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: AnimatedSmoothIndicator(
            activeIndex: activeIndex,
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
  Widget _items(SliderProductModel items){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 200,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(items.image),
              fit: BoxFit.cover,
            )
        ),
      ),
    );
  }


}
