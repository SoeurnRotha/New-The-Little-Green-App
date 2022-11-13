
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


import '../Loadding/loadding_for_search_product.dart';
import '../product/DetailPageForViewProduct.dart';
class Popular_Search extends StatefulWidget {
  const Popular_Search({Key? key}) : super(key: key);

  @override
  State<Popular_Search> createState() => _Popular_SearchState();
}

class _Popular_SearchState extends State<Popular_Search> {
  /// search product Popular
  String searchName = "";




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Container(
          width: MediaQuery.of(context).size.width,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white

          ),
          child: Center(
            child: TextField(

              style: TextStyle(fontSize: 17),
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  hintText: "Search for item in store",
                  hintStyle: TextStyle(fontSize: 17,fontFamily: "f1",fontWeight: FontWeight.bold),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: (){
                    },
                  ),
                prefixIcon:Icon(Icons.search) ,
                border: InputBorder.none,

              ),
              onChanged: (val){
                setState((){
                  searchName = val;
                });
              },
            ),
          ),
        ),

      ),
      body: _buildBody,
    );
  }
  get _buildBody {
    return _buildSearchData();
  }

  Widget _buildSearchData(){
    return StreamBuilder<QuerySnapshot>(
      stream: (searchName !="" && searchName !=null)
      ? FirebaseFirestore.instance
      .collection('PopularProduct')
      .where('tag', arrayContains: searchName)
      .snapshots()
      : FirebaseFirestore.instance.collection('PopularProduct').snapshots(),
      builder: (context , snapshot){
        return (snapshot.connectionState == ConnectionState.waiting)
        ///-> loadding products
            ? LoaddingSearchProducts()
            : ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context , index){
                DocumentSnapshot data = snapshot.data!.docs[index];
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Container(
                        height: 200,
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> productView(desInfo: data['desInfo'], proInfo: data['proInfo'] ,imageProduct: data['image'],nameProduct: data['name'],priceProduct: data['price'],)));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 180,
                                  width: 180,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(data['image']),
                                          fit: BoxFit.cover
                                      ),
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 10,),
                                    Text(data['name'],style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, fontFamily: "f1"),),
                                    SizedBox(height: 20,),
                                    Text("\$${data['price']}",style: TextStyle(fontSize: 15,fontFamily: "f1"),),
                                    SizedBox(height: 20,),

                                    GestureDetector(
                                      onTap: (){

                                      },
                                      child: Container(
                                        width: 130,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: Colors.grey
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.add),
                                            Text("Add to Cart",style: TextStyle(fontSize: 15,fontFamily: "f1"),),
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
                  ),
                );
          },
        );
      },
    );
  }



}



