import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'InsertData to Firebase/Recomment_InsertData_to_Firebase.dart';
import 'Update_Data And Delete_Data to Firebase/Recomment_updata_And_Delete.dart';
class Recomments_Admin extends StatefulWidget {
  const Recomments_Admin({Key? key}) : super(key: key);

  @override
  State<Recomments_Admin> createState() => Recomments();
}

class Recomments extends State<Recomments_Admin> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        
        title: Text("Recomment Products", style: TextStyle(fontFamily: "f1", fontSize: 20, fontWeight: FontWeight.bold ,color: Colors.black),),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded , size: 30 , color: Colors.black,),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: _buildBody,
    );
  }
  get _buildBody{
    return Container(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(height: 20,),
          InkWell(child: _buildDataToFireBase("images/admin/icon/add.png","Insert"), onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> InsertData_Recomments())),),
          SizedBox(height: 20,),
          InkWell(child: _buildDataToFireBase("images/admin/icon/edit.png", "Update And Delete"), onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> Recomment_update_data())),),

        ],

      ),
    );
  }
  Widget _buildDataToFireBase(String img,String name){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(

        width: MediaQuery.of(context).size.width,
        height: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset.zero,
              color: Colors.grey,
              blurRadius: 10,
            )
          ]
        ),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: 150,
                  height: 150,
                  child: Image.asset(img)),
              Text(name,style: TextStyle(fontSize: 30,fontFamily: "f1",fontWeight: FontWeight.bold),)
            ],
          ),
        ),
      ),
    );
  }
}
