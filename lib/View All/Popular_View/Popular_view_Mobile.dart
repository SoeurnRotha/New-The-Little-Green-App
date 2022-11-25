import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_little_green_product_e_com/Mobile_App/helper/popular_product_helper.dart';
import 'package:the_little_green_product_e_com/Mobile_App/helper/recomment_product_helper.dart';
import 'package:the_little_green_product_e_com/Mobile_App/model/popular_product_model.dart';

import '../../Detail_Page/Product_detail.dart';
import '../../Mobile_App/model/recomment_product_model.dart';

class Popular_view_Mobile extends StatefulWidget {
  const Popular_view_Mobile({Key? key}) : super(key: key);

  @override
  State<Popular_view_Mobile> createState() => _Popular_view_MobileState();
}

class _Popular_view_MobileState extends State<Popular_view_Mobile> {
  PopularHepler _popularHepler = PopularHepler();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar,
      body: StreamBuilder<QuerySnapshot>(
        stream: _popularHepler.read(),
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
      title: Text("Popular View all",style: TextStyle(fontSize: 20,fontFamily: "f2",fontWeight: FontWeight.bold,color: Colors.black),),

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
    List<PopularModel> popular = doc.map((data) =>
        PopularModel.fromSnapshot(data)).toList();


    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 10,
            childAspectRatio: 0.75, crossAxisCount: 2,
            mainAxisSpacing: 20

        ),
        itemCount: popular.length,
        itemBuilder: (context, index){
          return _buildItems(popular[index]);
        },
      ),
    );
  }

  Widget _buildItems(PopularModel items){
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
