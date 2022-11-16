import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_little_green_product_e_com/helper/recomment_product_helper.dart';
import 'package:the_little_green_product_e_com/model/recomment_product_model.dart';

import '../Custom_Scrool.dart';
class Recomment_Mobile extends StatefulWidget {
  const Recomment_Mobile({Key? key}) : super(key: key);

  @override
  State<Recomment_Mobile> createState() => _Recomment_MobileState();
}

class _Recomment_MobileState extends State<Recomment_Mobile> {
  RecommentHepler _recommentHepler = RecommentHepler();
  bool isHover =false;
  Offset mousePos = new Offset(0, 0);
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
      stream: _recommentHepler.read(),
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
  Widget _buildListView(List<QueryDocumentSnapshot> doc) {
    List<RecommentProductModel> recommentList = doc.map((data) =>
        RecommentProductModel.fromSnapshot(data)).toList();

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      itemCount: recommentList.length,
      itemBuilder: (context, index) {
        return _buildItems(recommentList[index]);
      },
    );
  }


  Widget _buildItems(RecommentProductModel items){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MouseRegion(
            onEnter: (e){
              setState(() {

              });
            },
            onHover: (e){
              setState(() {

              });
            },
            onExit: (e){
              setState(() {

              });
            },

            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[100],
                  image: DecorationImage(
                      image: NetworkImage("${items.image}"),
                      fit: BoxFit.cover
                  )
              ),
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
