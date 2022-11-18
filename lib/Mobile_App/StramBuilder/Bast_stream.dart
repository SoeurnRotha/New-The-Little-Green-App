import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Loadding/loadding_for_products_at_homePage.dart';
import '../helper/bast_product_helper.dart';
import '../model/bast_product_model.dart';
import '../product/DetailPageForViewProduct.dart';

class BastStream extends StatefulWidget {
  const BastStream({Key? key}) : super(key: key);

  @override
  State<BastStream> createState() => _BastStreamState();
}

class _BastStreamState extends State<BastStream> {
  BastHelper _bastHelper = BastHelper();
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 350,
        child: _buildStreamBulider
    );
  }
  Widget get _buildStreamBulider{
    return StreamBuilder<QuerySnapshot>(
        stream: _bastHelper.read(),
        builder: (context , snapshot){
          if(snapshot.hasError){
            return Text("Error");
          }else{

            if(snapshot.hasData){
              return _buildListView(snapshot.data!.docs);
            }else{
              return  LoaddingProduct();
            }

          }
        }
    );
  }
  Widget _buildListView(List<DocumentSnapshot> documents){
    List<BastProductModel> bastList = documents.map((data) => BastProductModel.fromSnapshot(data)).toList();
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: bastList.length,
      itemBuilder: (context, index){
        return _buildItem(bastList[index]);
      },
    );
  }
  Widget _buildItem(BastProductModel items){
    return Container(
      child: GestureDetector(
        onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> productView(proInfo: items.proInfo,desInfo: items.desInfo,imageProduct: items.image,nameProduct: items.name,priceProduct: items.price,))),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          height: 300,
          width: 180,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)
                    ),
                    image: DecorationImage(
                        image: NetworkImage(items.image),
                        fit: BoxFit.cover
                    )
                ),
              ),
              SizedBox(height: 10,),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(child: Text(items.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20, fontFamily: "f1"),)),
                      Text("\$${items.price}",style: TextStyle(fontSize: 16, fontFamily: "f1"),)
                    ],
                  )
              ),
              // ElevatedButton(
              //   onPressed: ()async{
              //     final FirebaseAuth _auth = FirebaseAuth.instance;
              //     final currenUser = _auth.currentUser;
              //     CollectionReference _reference = FirebaseFirestore.instance.collection("AddCart");
              //     return _reference.doc(currenUser!.uid).collection("items").doc().set(
              //         {
              //           "image": items.image,
              //           "name": items.name,
              //           "price": items.price,
              //           "proInfo": items.proInfo,
              //           "desInfo": items.desInfo,
              //         }
              //     ).then((value) => ScaffoldMessenger.of(context).showSnackBar(
              //         SnackBar(
              //           duration: Duration(seconds: 1),
              //           content: Container(
              //             height: 70,
              //             width: MediaQuery.of(context).size.width,
              //             decoration: BoxDecoration(
              //               color: Colors.lightGreenAccent,
              //               borderRadius: BorderRadius.circular(10),
              //             ),
              //             child: Center(
              //               child: Text("You Add to cart successfuly",style: TextStyle(fontFamily: "f2",color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
              //             ),
              //           ),
              //           behavior: SnackBarBehavior.floating,
              //           backgroundColor: Colors.transparent,
              //           elevation: 0,
              //         )
              //     ));
              //   },
              //   style: ElevatedButton.styleFrom(
              //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              //       fixedSize: Size(150, 40),
              //       primary: Colors.blueGrey
              //   ),
              //   child: Text("Add to carts", style: TextStyle(fontFamily: "f1"),),
              // ),
              SizedBox(height: 10,),



            ],
          ),
        ),
      ),
    );
  }


}
