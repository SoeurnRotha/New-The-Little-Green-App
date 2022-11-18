import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class productView extends StatefulWidget {
  final String nameProduct;
  final String imageProduct;
  final String priceProduct;

  final String proInfo;
  final String desInfo;

  const productView({Key? key ,this.imageProduct="", this.nameProduct="", this.priceProduct = "", required this.proInfo, required this.desInfo}) : super(key: key);

  @override
  State<productView> createState() => _productViewState();
}

class _productViewState extends State<productView> {

  Future addToCart()async{
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final currenUser = _auth.currentUser;
    CollectionReference _reference = FirebaseFirestore.instance.collection("AddCart");
    double total = double.parse(widget.priceProduct) * qty;
    return _reference.doc(currenUser!.uid).collection("items").doc().set(
        {
          "image": widget.imageProduct,
          "name": widget.nameProduct,
          "price": widget.priceProduct,
          "proInfo": widget.proInfo,
          "desInfo": widget.desInfo,
          "QTY" : qty,
          "total" : total

        }
    ).then((value) => print("Add to cart"));

  }
  Future addToFavorite()async{
    // final FirebaseAuth _auth = FirebaseAuth.instance;
    // final currenUser = _auth.currentUser;
    // CollectionReference _reference = FirebaseFirestore.instance.collection("AddFavorite");
    //
    // return _reference.doc(currenUser!.uid).collection("items").doc().set(
    //     {
    //       "image": widget.imageProduct,
    //       "name": widget.nameProduct,
    //       "price": widget.priceProduct,
    //       "proInfo": widget.proInfo,
    //       "desInfo": widget.desInfo,
    //     }
    // ).then((value) => print("Add to Favorite"));

    CollectionReference collectionReference = FirebaseFirestore.instance.collection("AddFavorite");
    await collectionReference.doc(FirebaseAuth.instance.currentUser!.uid).collection("items").add({
             "image": widget.imageProduct,
            "name": widget.nameProduct,
            "price": widget.priceProduct,
            "proInfo": widget.proInfo,
            "desInfo": widget.desInfo,
    });

  }

  Future removieFavorite(String id) async {
    CollectionReference collectionReference = FirebaseFirestore.instance.collection("AddFavorite");
    await collectionReference.doc(FirebaseAuth.instance.currentUser!.uid).collection("items").doc(id).delete();
  }

  int qty = 1;

  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    double total = double.parse(widget.priceProduct);
    total = qty * total;
    return Scaffold(
      // appBar: _buildAppbar,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 380,
            leading: IconButton(
              icon: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white
                ),
                child: Center(child: Icon(Icons.arrow_back_ios_rounded,color: Colors.black,)),
              ),
              onPressed: ()=>  Navigator.pop(context),
            ),
            actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection("AddFavorite").doc(FirebaseAuth.instance.currentUser!.uid).collection("items").where("name", isEqualTo: widget.nameProduct).snapshots(),
                  builder: (BuildContext context, snapshot){
                    if(snapshot.data == null){
                      return Text("");
                    }
                    return Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle
                      ),
                      child: IconButton(
                        icon: Icon(Icons.favorite,
                        color: snapshot.data!.docs.length == 0 ? Colors.black : Colors.redAccent ,),
                        onPressed: (){
                          snapshot.data!.docs.length == 0 ? addToFavorite() : removieFavorite(snapshot.data!.docs.first.id);
                        },

                      ),
                    );
                  },
              ),
                ),

            ],
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(widget.nameProduct,style: TextStyle(fontFamily: "f2",fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
              background: Image.network(widget.imageProduct, fit: BoxFit.cover,),
            ),
            backgroundColor: Colors.white,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.nameProduct, style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, fontFamily: "f1"),),
                    Container(
                      alignment: Alignment.center,
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          color: Colors.blueGrey
                      ),
                      child: Text("\$${widget.priceProduct}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white, fontFamily: "f1"),),
                    ),

                  ],
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child:Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Product information", style: TextStyle(fontFamily: "f1", fontWeight: FontWeight.bold, fontSize: 20,letterSpacing: 2),),
                    SizedBox(height: 10,),
                    Text(widget.proInfo, style: TextStyle(fontSize: 18,fontFamily: "f2"),)
                  ],
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Description information", style: TextStyle(fontFamily: "f1", fontWeight: FontWeight.bold, fontSize: 20,letterSpacing: 2),),
                    SizedBox(height: 10,),
                    Text(widget.desInfo, style: TextStyle(fontSize: 18,fontFamily: "f2"),)
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(

            child: Padding(
              padding: const EdgeInsets.only(top: 10,left: 8,right: 220,bottom: 10),
              child: Container(
                width: 200,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: (){
                        if(qty >1){
                          setState((){
                            qty--;

                          });
                        }
                      },
                    ),
                    Text("${qty}"),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: (){
                        if(qty >=1){
                          setState((){
                            qty++;
                          });
                        }
                      },
                    )
                  ],
                ),
              )
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Total = ${total}", style: TextStyle(fontSize: 20,color: Colors.green,fontWeight: FontWeight.bold,fontFamily: "f1"),),
            )
          ),


          SliverToBoxAdapter(
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildAddToCart(),
              ],
            ),
          ),


        ],
        physics: BouncingScrollPhysics(),
      ),

      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 5),
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(

              height: 60,
              // width: MediaQuery.of(context).size.width /2,
              width: 170,
              child: Center(child: Text("USD ${widget.priceProduct}", style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: "f1",fontWeight: FontWeight.bold),)),
            ),
            InkWell(
              onTap: (){

              },
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.lightGreenAccent,
                  borderRadius: BorderRadius.circular(25)
                ),
                // width: MediaQuery.of(context).size.width /2,
                width: 170,
                child: Center(child: Text("Buy Now", style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: "f2",fontWeight: FontWeight.bold),)),

              ),
            )
          ],
        ),
      )


    );
  }


  Widget _buildAddToCart(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
              onTap: (){
                addToCart();
                ScaffoldMessenger.of(context).showSnackBar(
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
                );
              },
              child: Container(
                height: 60,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey,

                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add,size: 20,),
                    SizedBox(width: 10,),
                    Text("Add to Cart",style: TextStyle(fontSize: 20,fontFamily: "f2",fontWeight: FontWeight.bold),),

                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
              onTap: (){

              },
              child: Container(
                height: 60,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey,

                ),
                child:   Center(child: Text("Buy Now",style: TextStyle(fontSize: 20,fontFamily: "f2",fontWeight: FontWeight.bold),))
              ),
            ),
          ),

        ],

    );
  }

}
