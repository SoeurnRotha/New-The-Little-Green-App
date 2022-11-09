import 'package:flutter/material.dart';

class CheackOutPage extends StatefulWidget {
  const CheackOutPage({Key? key, this.imageProduct, this.nameProduct, this.priceProduct}) : super(key: key);
  final imageProduct;
  final nameProduct;
  final priceProduct;


  @override
  State<CheackOutPage> createState() => _CheackOutPageState();
}

class _CheackOutPageState extends State<CheackOutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cheack Out page"),
      ),

      body: _buildBody,
      bottomNavigationBar: _buildBottom
    );
  }
  get _buildBody{
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Text("Cheack Out",style: TextStyle(fontFamily: "f1", fontSize: 30,fontWeight: FontWeight.bold),),
          _buildItens,
          _buildItens,
          _buildItens,

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total", style: TextStyle(fontFamily: "f1", fontSize: 20,fontWeight: FontWeight.bold),),
                Text("Price", style: TextStyle(fontFamily: "f1", fontSize: 20,fontWeight: FontWeight.bold),),
              ],
            ),
          )
        ],
      ),
    );
  }
  get _buildBottom{
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(15),

        ),
        child: Center(
          child: Text("Buy", style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "f1", fontSize: 20),),
        ),
      ),
    );
  }
  get _buildItens{
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
                    // decoration: BoxDecoration(
                    //     image: DecorationImage(
                    //         image: NetworkImage(documentSnapshot['image']),
                    //         fit: BoxFit.cover
                    //     ),
                    //     borderRadius: BorderRadius.circular(10)
                    // ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(documentSnapshot['name'],style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,fontFamily: "f1"),),
                      SizedBox(height: 10,),
                      // Text("\$${documentSnapshot['price']}",style: TextStyle(fontSize: 16,fontFamily: "f1"),),
                      SizedBox(height: 10,),
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
                          // FirebaseFirestore.instance.collection("AddCart").doc(FirebaseAuth.instance.currentUser!.email).collection("items").doc(documentSnapshot.id).delete();
                        },
                        child: Container(
                          width: 130,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.green
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("QTY",style: TextStyle(fontSize: 15,color: Colors.white,fontFamily: "f1"),),
                              Text("10"),
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
