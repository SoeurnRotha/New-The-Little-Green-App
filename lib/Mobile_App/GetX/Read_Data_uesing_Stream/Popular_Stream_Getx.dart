import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../Loadding/loadding_for_products_at_homePage.dart';
import '../../product/DetailPageForViewProduct.dart';
import '../Controller/Home_Controller.dart';

class Popular_Stream_Getx extends StatefulWidget {
  const Popular_Stream_Getx({Key? key}) : super(key: key);

  @override
  State<Popular_Stream_Getx> createState() => _Popular_Stream_GetxState();
}

class _Popular_Stream_GetxState extends State<Popular_Stream_Getx> {
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: GetBuilder<HomeController>(
        builder: (value){
          if(!value.isLoadding){
            return ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: controller.popular_product.length,
              itemBuilder: (context, index){
                return Container(
                  child: GestureDetector(
                    onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> productView(imageProduct: controller.popular_product[index].image,nameProduct: controller.popular_product[index].name,priceProduct: controller.popular_product[index].price, proInfo: controller.popular_product[index].proInfo, desInfo: controller.popular_product[index].desInfo,))),
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
                                    image: NetworkImage(controller.popular_product[index].image),
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
                                  Container(child: Text(controller.popular_product[index].name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20, fontFamily: "f1"),)),
                                  Text("\$${controller.popular_product[index].price}",style: TextStyle(fontSize: 16, fontFamily: "f1"),)
                                ],
                              )
                          ),
                          ElevatedButton(
                            onPressed: ()async{
                              final FirebaseAuth _auth = FirebaseAuth.instance;
                              final currenUser = _auth.currentUser;
                              CollectionReference _reference = FirebaseFirestore.instance.collection("AddCart");
                              return _reference.doc(currenUser!.email).collection("items").doc().set(
                                  {
                                    "image": controller.popular_product[index].image,
                                    "name": controller.popular_product[index].name,
                                    "price": controller.popular_product[index].price,

                                  }
                              ).then((value) => ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    duration: Duration(seconds: 1),
                                    content: Container(
                                      height: 70,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: Colors.lightGreenAccent,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text("You Add to cart successfuly",style: TextStyle(fontFamily: "f2",color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                                      ),
                                    ),
                                    behavior: SnackBarBehavior.floating,
                                    backgroundColor: Colors.transparent,
                                    elevation: 0,
                                  )
                              ));

                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                fixedSize: Size(150, 40),
                                primary: Colors.blueGrey
                            ),
                            child: Text("Add to carts", style: TextStyle(fontFamily: "f1"),),
                          ),
                          SizedBox(height: 10,),



                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }else {
            return LoaddingProduct();
          }
        },
      ),
    );
  }
}
