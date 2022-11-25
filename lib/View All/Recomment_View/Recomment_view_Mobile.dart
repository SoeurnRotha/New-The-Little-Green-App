import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_little_green_product_e_com/Mobile_App/helper/recomment_product_helper.dart';

import '../../Detail_Page/Product_detail.dart';
import '../../Mobile_App/model/recomment_product_model.dart';

class Recomment_view_Mobile extends StatefulWidget {
  const Recomment_view_Mobile({Key? key}) : super(key: key);

  @override
  State<Recomment_view_Mobile> createState() => _Recomment_view_MobileState();
}

class _Recomment_view_MobileState extends State<Recomment_view_Mobile> {
  RecommentHepler _recommentHepler = RecommentHepler();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar,
      body: StreamBuilder<QuerySnapshot>(
        stream: _recommentHepler.read(),
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
      title: Text("Recomment View all",style: TextStyle(fontSize: 20,fontFamily: "f2",fontWeight: FontWeight.bold,color: Colors.black),),

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
    List<RecommentProductModel> recommentList = doc.map((data) =>
        RecommentProductModel.fromSnapshot(data)).toList();


    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10,
          childAspectRatio: 0.75, crossAxisCount: 2,
          mainAxisSpacing: 20

        ),
        itemCount: recommentList.length,
        itemBuilder: (context, index){
          return _buildItems(recommentList[index]);
        },
      ),
    );
  }

  Widget _buildItems(RecommentProductModel items){
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
