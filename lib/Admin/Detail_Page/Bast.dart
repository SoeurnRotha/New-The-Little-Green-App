import 'package:flutter/material.dart';

import 'InsertData to Firebase/Bast_InsertData_to_Firebasea.dart';
import 'Update_Data And Delete_Data to Firebase/Bast_update_And_Delete.dart';

class Bast extends StatefulWidget {
  const Bast({Key? key}) : super(key: key);

  @override
  State<Bast> createState() => _BastState();
}

class _BastState extends State<Bast> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Bast Products" ,style: TextStyle(fontFamily: "f1" , fontSize: 20 , fontWeight: FontWeight.bold, color: Colors.black),),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded , size: 30 , color: Colors.black,),
          onPressed: () => Navigator.pop(context),
        ),
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
            Navigator.push(context, MaterialPageRoute(builder: (context)=> InsertData_Bast()));
          },
          child:      _buildDataToFireBase("images/admin/icon/add.png","Insert data"),
        ),
        SizedBox(height: 20,),
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Bast_update_data()));
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
