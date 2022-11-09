import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewInformation_Page extends StatefulWidget {
  final String nameProduct;
  final String imageProduct;
  final String priceProduct;
  final String productInfo;
  final String desInfo;
  const ViewInformation_Page({Key? key, required this.nameProduct, required this.imageProduct, required this.priceProduct, required this.productInfo, required this.desInfo}) : super(key: key);

  @override
  State<ViewInformation_Page> createState() => _ViewInformation_PageState();
}

class _ViewInformation_PageState extends State<ViewInformation_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_rounded, size: 30, color: Colors.black,),
              onPressed: ()=> Navigator.pop(context),
            ),
            expandedHeight: 350,
            backgroundColor: Colors.lightGreenAccent,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.imageProduct),
                    fit: BoxFit.cover
                  )
                ),
              ),
              centerTitle: true,
              title: Text(widget.nameProduct, style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: "f1", color: Colors.black),),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.nameProduct, style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, fontFamily: "f1"),),
                    Container(
                      alignment: Alignment.center,
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          color: Colors.blueGrey
                      ),
                      child: Text("\$${widget.priceProduct}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white, fontFamily: "f1"),),
                    ),

                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child:  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Product information", style: TextStyle(fontFamily: "f1", fontWeight: FontWeight.bold, fontSize: 30,letterSpacing: 2, decoration: TextDecoration.underline),),
                    SizedBox(height: 10,),
                    Text(widget.productInfo, style: TextStyle(fontSize: 18,fontFamily: "f2",fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Description information", style: TextStyle(fontFamily: "f1", fontWeight: FontWeight.bold, fontSize: 30,letterSpacing: 2,decoration: TextDecoration.underline),),
                    SizedBox(height: 10,),
                    Text(widget.desInfo, style: TextStyle(fontSize: 18,fontFamily: "f2",fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            ),
          ),


        ],
      ),

    );

  }
  get _buildBody{
    return Container(
      color: Colors.grey[300],
      width: MediaQuery.of(context).size.width,
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            color: Colors.amberAccent,
            height: 300,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.imageProduct),
                    fit: BoxFit.cover,
                  )
              ),
              // child: Image.network(widget.imageProduct)
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.nameProduct, style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, fontFamily: "f1"),),
                  Container(
                    alignment: Alignment.center,
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        color: Colors.blueGrey
                    ),
                    child: Text("\$${widget.priceProduct}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white, fontFamily: "f1"),),
                  ),

                ],
              ),
            ),
          ),


          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Product information", style: TextStyle(fontFamily: "f1", fontWeight: FontWeight.bold, fontSize: 30,letterSpacing: 2, decoration: TextDecoration.underline),),
                  SizedBox(height: 10,),
                  Text(widget.productInfo, style: TextStyle(fontSize: 18,fontFamily: "f2",fontWeight: FontWeight.bold),),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Description information", style: TextStyle(fontFamily: "f1", fontWeight: FontWeight.bold, fontSize: 30,letterSpacing: 2,decoration: TextDecoration.underline),),
                  SizedBox(height: 10,),
                  Text(widget.desInfo, style: TextStyle(fontSize: 18,fontFamily: "f2",fontWeight: FontWeight.bold),),
                ],
              ),
            ),
          ),
          SizedBox(height: 10,),



        ],
      ),
    );
  }
}
