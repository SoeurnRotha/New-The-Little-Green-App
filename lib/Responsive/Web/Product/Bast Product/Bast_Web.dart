import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../Detail_Page/Product_detail.dart';
import '../../../../Mobile_App/helper/bast_product_helper.dart';
import '../../../../Mobile_App/model/bast_product_model.dart';
import '../Custom_Scrool.dart';
class Bast_Web extends StatefulWidget {
  const Bast_Web({Key? key}) : super(key: key);

  @override
  State<Bast_Web> createState() => _Bast_WebState();
}

class _Bast_WebState extends State<Bast_Web> {
  BastHelper _bastHelper = BastHelper();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 450,

      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: _buildStream
      ),
    );
  }
  get _buildStream{
    return StreamBuilder<QuerySnapshot>(
      stream: _bastHelper.read(),
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
    List<BastProductModel> bast = doc.map((data) => BastProductModel.fromSnapshot(data)).toList();

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      itemCount: bast.length,
      itemBuilder: (context, index){
        return _buildItems(bast[index]);
      },
    );
  }

  Widget _buildItems(BastProductModel items){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailProduct(
              image: items.image,
              name: items.name,
              price: items.price,
              proInfo: items.proInfo,
              desInfo: items.desInfo,
            ))),
            child: Container(
              width: 200,
              height: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[100],
                  image: DecorationImage(
                    image: NetworkImage(items.image),
                    fit: BoxFit.cover,
                  )
              ),
            ),
          ),
          SizedBox(height: 10,),
          Container(
            alignment: Alignment.center,
            width: 200,
            child: Text(items.name,style: TextStyle(fontFamily: "f2",fontSize: 15),maxLines: 1,overflow: TextOverflow.ellipsis),
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
