
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';



import '../Loadding/loadding_for_search_product.dart';
import '../helper/Cart_helper.dart';
import '../model/CartModel.dart';
import 'CheackOut.dart';
class myCarts extends StatefulWidget {
  const myCarts({Key? key}) : super(key: key);

  @override
  State<myCarts> createState() => _myCartsState();
}

class _myCartsState extends State<myCarts> {
  CartHelper cartHelper = CartHelper();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody,


    );
  }


  get _buildBody{
    return StreamBuilder<QuerySnapshot>(
        stream: cartHelper.read(),
        builder: (context , snapshot){

          if(snapshot.hasError){
            return Text("Error");
          }else{
            if(snapshot.hasData){
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index){
                  DocumentSnapshot documentSnapshot = snapshot.data!.docs[index];

                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                         child:  Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Container(
                             height: 200,
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                     Text(documentSnapshot['name'],style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,fontFamily: "f1"),),
                                     SizedBox(height: 10,),
                                     Text("\$${documentSnapshot['price']}",style: TextStyle(fontSize: 16,fontFamily: "f1"),),
                                     SizedBox(height: 10,),
                                     Row(
                                       children: [
                                         IconButton(
                                           icon: Icon(Icons.remove),
                                           onPressed: (){
                                             setState(() {
                                               // if(qty>1){
                                               //   qty--;
                                               // }

                                             });
                                           },
                                         ),
                                         Text("${documentSnapshot['QTY']}"),
                                         IconButton(
                                           icon: Icon(Icons.add),
                                           onPressed: (){
                                             setState(() {
                                               // if(qty>=1){
                                               //   qty++;
                                               // }
                                             });
                                           },
                                         ),

                                       ],
                                     ),
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
                                                   child: Text("You remove your product successfuly",style: TextStyle(fontFamily: "f2",color: Colors.white,fontSize: 18),),
                                                 ),
                                               ),
                                               behavior: SnackBarBehavior.floating,
                                               backgroundColor: Colors.transparent,
                                               elevation: 0,
                                             )
                                         );
                                         FirebaseFirestore.instance.collection("AddCart").doc(FirebaseAuth.instance.currentUser!.uid).collection("items").doc(documentSnapshot.id).delete();
                                       },
                                       child: Container(
                                         width: 130,
                                         height: 50,
                                         decoration: BoxDecoration(
                                             borderRadius: BorderRadius.circular(20),
                                             color: Colors.red
                                         ),
                                         child: Row(
                                           mainAxisAlignment: MainAxisAlignment.center,
                                           children: [
                                             Icon(Icons.delete,color: Colors.white,),
                                             Text("Remove",style: TextStyle(fontSize: 15,color: Colors.white,fontFamily: "f1"),),
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
                      ),

                      Text("${snapshot.data!.docs.toString()}")
                    ],
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

  Widget _buildList(List<DocumentSnapshot> documents){
    List<CartModel> cart = documents.map((data) => CartModel.fromSnapshot(data)).toList();
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: cart.length,
      itemBuilder: (context, index){
        return _buildItems(cart[index]);

      },
    );
  }

  Widget _buildItems(CartModel items){
    int qty = items.qty;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 170,
                    width: 170,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(items.image),
                            fit: BoxFit.cover
                        ),
                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(items.name,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,fontFamily: "f1"),),
                      SizedBox(height: 10,),
                      Text("\$${items.price}",style: TextStyle(fontSize: 16,fontFamily: "f1"),),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: (){
                              setState(() {
                                if(qty >1){
                                  qty --;
                                }
                              });
                              },
                          ),
                          Text("${qty}"),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: (){
                              setState(() {
                                if(qty >=1){
                                  qty ++;
                                }
                              });
                              },
                          ),

                        ],
                      ),
                      Text("QTY : ${items.qty}",style: TextStyle(fontSize: 16,fontFamily: "f1"),),
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
                                    child: Text("You remove your product successfuly",style: TextStyle(fontFamily: "f2",color: Colors.white,fontSize: 18),),
                                  ),
                                ),
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                              )
                          );
                          FirebaseFirestore.instance.collection("AddCart").doc(FirebaseAuth.instance.currentUser!.uid).collection("items").doc().delete();
                        },
                        child: Container(
                          width: 130,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.red
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.delete,color: Colors.white,),
                              Text("Remove",style: TextStyle(fontSize: 15,color: Colors.white,fontFamily: "f1"),),
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
      ),
    );
  }


}
