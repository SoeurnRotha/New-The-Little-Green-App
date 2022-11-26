import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_little_green_product_e_com/Mobile_App/helper/recomment_product_helper.dart';

import '../../Detail_Page/Product_detail.dart';
import '../../Mobile_App/model/recomment_product_model.dart';

class Bast_view_Tablat extends StatefulWidget {
  const Bast_view_Tablat({Key? key}) : super(key: key);

  @override
  State<Bast_view_Tablat> createState() => _Bast_view_TablatState();
}

class _Bast_view_TablatState extends State<Bast_view_Tablat> {

  String searchName = "";




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar,
      body: _buildSearchData(),
    );
  }

  get _buildAppbar {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_rounded, size: 30, color: Colors.black,),
        onPressed: () => Navigator.pop(context),
      ),
      title: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey[200]

        ),
        child: Center(
          child: TextField(

            style: TextStyle(
                fontSize: 17, fontFamily: "f2", fontWeight: FontWeight.bold),
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: "Search product here",
              hintStyle: TextStyle(
                  fontSize: 17, fontFamily: "f2", fontWeight: FontWeight.bold),
              prefixIcon: Icon(Icons.search),
              border: InputBorder.none,

            ),
            onChanged: (val) {
              setState(() {
                searchName = val;
              });
            },
          ),
        ),
      ),


    );
  }

  Widget _buildSearchData() {
    return StreamBuilder<QuerySnapshot>(
        stream: (searchName != "" && searchName != null)
            ? FirebaseFirestore.instance
            .collection('BastProducts')
            .where('tag', arrayContains: searchName)
            .snapshots()
            : FirebaseFirestore.instance.collection('BastProducts').snapshots(),
        builder: (context, snapshot) {
          return (snapshot.connectionState == ConnectionState.waiting)
              ? Center(child: CircularProgressIndicator(),)
              : Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              physics: BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.65, crossAxisCount: 4,
                  mainAxisSpacing: 20

              ),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot data = snapshot.data!.docs[index];
                return GestureDetector(
                  onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailProduct(
                    image:  data['image'],
                    name:  data['name'],
                    price:  data['price'],
                    proInfo:  data['proInfo'],
                    desInfo:  data['desInfo'],
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
                                    image: NetworkImage( data['image']),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Column(
                          children: [
                            Container(child: Text( data['name'],style: TextStyle(fontSize: 18,fontFamily: "f2",fontWeight: FontWeight.bold),maxLines: 1, overflow: TextOverflow.ellipsis,)),
                            Container(child: Text("\$${data['price']}",style: TextStyle(fontSize: 18,fontFamily: "f2",fontWeight: FontWeight.bold), maxLines: 1,overflow: TextOverflow.ellipsis,)),
                          ],

                        ),
                        SizedBox(height: 10,),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
    );
  }

}