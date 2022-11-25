import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_little_green_product_e_com/Mobile_App/Admin/Detail_Page/Popular_Admin.dart';
import 'package:the_little_green_product_e_com/Mobile_App/helper/bast_product_helper.dart';
import 'package:the_little_green_product_e_com/Mobile_App/helper/indoor_product_helper.dart';
import 'package:the_little_green_product_e_com/Mobile_App/helper/popular_product_helper.dart';
import 'package:the_little_green_product_e_com/Mobile_App/helper/recomment_product_helper.dart';
import 'package:the_little_green_product_e_com/Mobile_App/model/bast_product_model.dart';
import 'package:the_little_green_product_e_com/Mobile_App/model/indoor_product_model.dart';
import 'package:the_little_green_product_e_com/Mobile_App/model/popular_product_model.dart';

import '../../Detail_Page/Product_detail.dart';
import '../../Mobile_App/model/recomment_product_model.dart';

class Indoor_view_Web extends StatefulWidget {
  const Indoor_view_Web({Key? key}) : super(key: key);

  @override
  State<Indoor_view_Web> createState() => _Indoor_view_WebState();
}

class _Indoor_view_WebState extends State<Indoor_view_Web> {
  IndoorHepler _indoorHepler = IndoorHepler();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: _buildAppbar,
      body: StreamBuilder<QuerySnapshot>(
        stream: _indoorHepler.read(),
        builder: (context , snapshot){
          if(snapshot.hasError){
            return Text("Error");
          }else if(snapshot.hasData){
            return _getDataFromFirebase(snapshot.data!.docs);
          }else{
            return Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    );
  }
  get _buildAppbar{
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_rounded,size: 30,color: Colors.black,),
        onPressed: ()=> Navigator.pop(context),
      ),
      centerTitle: true,
      title: Text("Indoor View all",style: TextStyle(fontSize: 20,fontFamily: "f2",fontWeight: FontWeight.bold,color: Colors.black),),

      actions: [
        IconButton(
          icon: Icon(Icons.search,size: 30,color: Colors.black,),
          onPressed: (){

          },
        )
      ],
    );
  }

  get _buildBoxSearch{
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
      child: TextField(
        style: TextStyle(fontSize: 20,fontFamily: "f2",fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          hintText: "Search here",
          hintStyle: TextStyle(fontSize: 20,fontFamily: "f2"),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }


  Widget _getDataFromFirebase(List<DocumentSnapshot> doc){
    List<IndoorModel> indoor = doc.map((data) =>
        IndoorModel.fromSnapshot(data)).toList();


    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 10,
            childAspectRatio: 0.65, crossAxisCount: 6,
            mainAxisSpacing: 20

        ),
        itemCount: indoor.length,
        itemBuilder: (context, index){
          return _buildItems(indoor[index]);
        },
      ),
    );
  }

  Widget _buildItems(IndoorModel items){
    double w = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailProduct(
        image: items.image,
        name: items.name,
        price: items.price,
        proInfo: items.proInfo,
        desInfo: items.desInfo,
      ))),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[100]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                height: 230,
                decoration: BoxDecoration(

                    image: DecorationImage(
                        image: NetworkImage(items.image),
                        fit: BoxFit.cover
                    )
                ),
              ),
            ),
            SizedBox(height: 20,),
            Column(

              children: [

                Container(child: Text(items.name,style: TextStyle(fontSize: 18,fontFamily: "f2",fontWeight: FontWeight.bold),maxLines: 1, overflow: TextOverflow.ellipsis,)),
                Container(child: Text(items.price,style: TextStyle(fontSize: 18,fontFamily: "f2",fontWeight: FontWeight.bold), maxLines: 1,overflow: TextOverflow.ellipsis,)),

              ],
            ),

            SizedBox(height: 10,),

          ],
        ),
      ),
    );
  }
}
