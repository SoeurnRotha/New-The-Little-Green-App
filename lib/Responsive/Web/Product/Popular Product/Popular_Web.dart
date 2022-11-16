import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_little_green_product_e_com/helper/popular_product_helper.dart';
import 'package:the_little_green_product_e_com/helper/recomment_product_helper.dart';
import 'package:the_little_green_product_e_com/model/popular_product_model.dart';
import 'package:the_little_green_product_e_com/model/recomment_product_model.dart';

import '../Custom_Scrool.dart';
class Popular_Web extends StatefulWidget {
  const Popular_Web({Key? key}) : super(key: key);

  @override
  State<Popular_Web> createState() => _Popular_WebState();
}

class _Popular_WebState extends State<Popular_Web> {
  PopularHepler _popularHepler = PopularHepler();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 350,
      color: Colors.grey,
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: _buildStream
      ),
    );
  }
  get _buildStream{
    return StreamBuilder<QuerySnapshot>(
      stream: _popularHepler.read(),
      builder: (context, snapshot){
        if(snapshot.hasError){
          return Center(child: Text("Error"));
        }else if(snapshot.hasData){
          return _buildListView(snapshot.data!.docs);
        }else{
          return Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }
  Widget _buildListView(List<QueryDocumentSnapshot> doc){
    List<PopularModel> popular = doc.map((data) => PopularModel.fromSnapshot(data)).toList();

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      itemCount: popular.length,
      itemBuilder: (context, index){
        return _buildItems(popular[index]);
      },
    );
  }

  Widget _buildItems(PopularModel items){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey[100],
                image: DecorationImage(
                  image: NetworkImage(items.image),
                  fit: BoxFit.cover,
                )
            ),
          ),
          SizedBox(height: 10,),
          Container(
            alignment: Alignment.center,
            width: 200,
            child: Text(items.name,style: TextStyle(fontFamily: "f2",fontSize: 15),),
          ),
          SizedBox(height: 10,),
          Container(
            child: Text("\$${items.price}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: "f1"),),
          )
        ],
      ),
    );
  }
}
