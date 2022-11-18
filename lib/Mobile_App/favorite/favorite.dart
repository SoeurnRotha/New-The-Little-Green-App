import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Loadding/loadding_for_search_product.dart';
import '../product/DetailPageForViewProduct.dart';
class FavoriteProduct extends StatefulWidget {
  const FavoriteProduct({Key? key}) : super(key: key);

  @override
  State<FavoriteProduct> createState() => _FavoriteProductState();
}

class _FavoriteProductState extends State<FavoriteProduct> {
  final _bucket= PageStorageBucket();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Favorite"),
      //
      // ),
      body: PageStorage(
        bucket:_bucket ,
        child: _buildBody,
      ),
    );
  }
  get _buildBody{
    return StreamBuilder<QuerySnapshot>(
      key: PageStorageKey<String> ("Favorite"),
        stream: FirebaseFirestore.instance.collection("AddFavorite").doc(FirebaseAuth.instance.currentUser!.uid).collection("items").snapshots(),
        builder: (context , snapshot){
          if(snapshot.hasError){
            return Text("Error");
          }else{
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index){
                  DocumentSnapshot documentSnapshot = snapshot.data!.docs[index];
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> productView(imageProduct: documentSnapshot['image'],nameProduct: documentSnapshot['name'],priceProduct: documentSnapshot['price'],proInfo: documentSnapshot['proInfo'],desInfo: documentSnapshot['desInfo'],)));
                    },
                    child: Card(
                      child: Expanded(
                        child: Container(
                          height: 200,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 170,
                                width: 170,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(documentSnapshot['image']),
                                        fit: BoxFit.cover
                                    ),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(documentSnapshot['name'],style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                  SizedBox(height: 10,),
                                  Text("\$${documentSnapshot['price']}",style: TextStyle(fontSize: 15),),
                                  SizedBox(height: 10,),

                                  //use for click add products
                                  InkWell(
                                    onTap: (){
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            duration: Duration(seconds: 1),
                                            content: Container(
                                              height: 70,
                                              width: MediaQuery.of(context).size.width,
                                              decoration: BoxDecoration(
                                                color: Colors.redAccent,
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              child: Center(
                                                child: Text("You remove your favorite successfuly",style: TextStyle(fontFamily: "f2",color: Colors.white,fontSize: 18),),
                                              ),
                                            ),
                                            behavior: SnackBarBehavior.floating,
                                            backgroundColor: Colors.transparent,
                                            elevation: 0,
                                          )
                                      );
                                      FirebaseFirestore.instance.collection("AddFavorite").doc(FirebaseAuth.instance.currentUser!.uid).collection("items").doc(snapshot.data!.docs.first.id).delete();
                                    },
                                    child: Container(
                                      width: 150,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: Colors.red
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.delete,color: Colors.white,),
                                          Text("Remove",style: TextStyle(fontSize: 15,color: Colors.white),),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }else{
              return LoaddingSearchProducts();
            }

          }
        }
    );
  }
}
