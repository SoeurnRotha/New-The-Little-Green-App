import 'package:flutter/material.dart';

import 'InsertData to Firebase/Outdoor_InsertData_to_Firebase.dart';
import 'Update_Data And Delete_Data to Firebase/Outdoor_update_And_Delete.dart';

class Outdoor extends StatefulWidget {
  const Outdoor({Key? key}) : super(key: key);

  @override
  State<Outdoor> createState() => _OutdoorState();
}

class _OutdoorState extends State<Outdoor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded , size: 30 , color: Colors.black,),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Outdoor Products", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold , fontFamily: "f1", color: Colors.black),),
      ),
      body: _buildBody,
    );
  }
  get _buildBody{
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        SizedBox(height: 20,),
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> InsertData_Outdoor()));
          },
          child:      _buildDataToFireBase("images/admin/icon/add.png","Insert data"),
        ),
        SizedBox(height: 20,),
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Outdoor_update_data()));
          },
          child:          _buildDataToFireBase("images/admin/icon/edit.png", "Update And Delete"),
        ),


      ],

    );
  }
  Widget _buildDataToFireBase(String img,String name){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 200,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10
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
