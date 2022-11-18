import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../Mobile_App/helper/outdoor_product_helper.dart';
import '../../../../Mobile_App/model/outdoor_product_model.dart';
import '../Custom_Scrool.dart';
class Outdoor_Tablat extends StatefulWidget {
  const Outdoor_Tablat({Key? key}) : super(key: key);

  @override
  State<Outdoor_Tablat> createState() => _Outdoor_TablatState();
}

class _Outdoor_TablatState extends State<Outdoor_Tablat> {
  OutdoorHelper _outdoorHelper = OutdoorHelper();
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
      stream: _outdoorHelper.read(),
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
    List<OutdoorModel> outdoor = doc.map((data) => OutdoorModel.fromSnapshot(data)).toList();

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      itemCount: outdoor.length,
      itemBuilder: (context, index){
        return _buildItems(outdoor[index]);
      },
    );
  }

  Widget _buildItems(OutdoorModel items){
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
