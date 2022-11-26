import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../../../Detail_Page/Product_detail.dart';
import '../../../../Mobile_App/helper/indoor_product_helper.dart';
import '../../../../Mobile_App/model/indoor_product_model.dart';
import '../Custom_Scrool.dart';
class Indoor_Mobile extends StatefulWidget {
  const Indoor_Mobile({Key? key}) : super(key: key);

  @override
  State<Indoor_Mobile> createState() => _Indoor_MobileState();
}

class _Indoor_MobileState extends State<Indoor_Mobile> {
  IndoorHepler _indoorHepler = IndoorHepler();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 350,

      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: _buildStream
      ),
    );
  }
  get _buildStream{
    return StreamBuilder<QuerySnapshot>(
      stream: _indoorHepler.read(),
      builder: (context, snapshot){
        if(snapshot.hasError){
          return Center(child: Text("Error"));
        }else if(snapshot.hasData){
          return _buildListView(snapshot.data!.docs);
        }else{
          return Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }
  Widget _buildListView(List<QueryDocumentSnapshot> doc){
    List<IndoorModel> indoor = doc.map((data) => IndoorModel.fromSnapshot(data)).toList();

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      itemCount: indoor.length,
      itemBuilder: (context, index){
        return _buildItems(indoor[index]);
      },
    );
  }

  Widget _buildItems(IndoorModel items){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailProduct(
              image: items.image,
              name: items.name,
              price: items.price,
              proInfo: items.proInfo,
              desInfo: items.desInfo,
            ))),
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[100],
                  image: DecorationImage(
                    image: NetworkImage(items.image),
                    fit: BoxFit.cover,
                  )
              ),
            ),
          ),
          SizedBox(height: 10,),
          Container(
            alignment: Alignment.center,
            width: 200,
            child: Text(items.name,style: TextStyle(fontFamily: "f2",fontSize: 15),maxLines: 2,overflow: TextOverflow.ellipsis),
          ),
          SizedBox(height: 10,),
          Container(
            child: Text("\$${items.price}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: "f1"),),
          )
        ],
      ),
    );
  }
}
