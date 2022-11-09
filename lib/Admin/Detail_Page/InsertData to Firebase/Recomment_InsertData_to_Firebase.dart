
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class InsertData_Recomments extends StatefulWidget {
  const InsertData_Recomments({Key? key}) : super(key: key);

  @override
  State<InsertData_Recomments> createState() => _InsertData_RecommentsState();
}

class _InsertData_RecommentsState extends State<InsertData_Recomments> {
  final productController = TextEditingController();
  final descriptionController = TextEditingController();
  final nameController = TextEditingController();
  final priceController = TextEditingController();

  //tag for search data

  final tag1 = TextEditingController();
  final tag2 = TextEditingController();
  final tag3 = TextEditingController();
  final tag4 = TextEditingController();
  final tag5 = TextEditingController();

  CollectionReference collectionReference = FirebaseFirestore.instance.collection("Recomments");
  
  void addData() async{
    final imageURL = await uploadImage(_image!);
    collectionReference.add({
      "image": imageURL,
      "name" : nameController.text.trim(),
      "price" : priceController.text,
      "proInfo" : productController.text,
      "desInfo" : descriptionController.text,
      "tag" : [tag1.text , tag2.text, tag3.text , tag4.text , tag5.text]

    }).whenComplete(() {
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
                child: Text("You Add your product successfuly",style: TextStyle(fontFamily: "f2",color: Colors.white,fontSize: 18),),
              ),
            ),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            elevation: 0,
          )
      );
    });
    
  }


  File? _image;
  final picker = ImagePicker();

  final String downloadURL = "";

  Future imagePicker() async {

    try{
      final pick = await picker.pickImage(source: ImageSource.gallery);
      setState((){
        if(pick != null){
          _image = File(pick.path);
        }else{
          print("No image seleted");
        }
      });
    }on PlatformException catch(e){
      print(e.toString());
    }

  }
  Future uploadImage(File _image) async{
    String url ;
    String imgId = DateTime.now().microsecondsSinceEpoch.toString();
    Reference ref =  FirebaseStorage.instance.ref().child('Recomments').child('Recomment product $imgId');
    await ref.putFile(_image);
    url = await ref.getDownloadURL();
    return url;
  }





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
        title: Text("Insert Data to Recomments", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold , fontFamily: "f1", color: Colors.black),),

      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  imagePicker().whenComplete(() => uploadImage(_image!));
                },
                child: Container(

                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey,

                  ),
                  child: _image != null ? Image.file(_image!.absolute, fit: BoxFit.cover,) : Center(
                    child: Icon(Icons.image, size: 50,),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: nameController,
                style: TextStyle(fontFamily: "f2", fontWeight: FontWeight.bold, fontSize: 20),
                decoration: InputDecoration(
                  hintText: "Input Name products",
                  hintStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: priceController,
                style: TextStyle(fontFamily: "f2", fontWeight: FontWeight.bold, fontSize: 20),
                decoration: InputDecoration(
                  hintText: "Input Price Products",
                  hintStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: TextField(
                  controller: productController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  style: TextStyle(fontSize: 20,),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    hintText: "Input Product information",
                    hintStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, fontFamily: "f2"),
                  ),
                ),

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child:  TextField(
                  controller: descriptionController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  style: TextStyle(fontSize: 20,),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    hintText: "Input Description information",
                    hintStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, fontFamily: "f2"),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Please enter keyword for information product whene user search products",style: TextStyle(fontSize: 30,fontFamily: "f2", fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: tag1,
                style: TextStyle(fontFamily: "f2", fontWeight: FontWeight.bold, fontSize: 20),
                decoration: InputDecoration(
                    hintText: "Enter Tag1",
                    hintStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: tag2,
                style: TextStyle(fontFamily: "f2", fontWeight: FontWeight.bold, fontSize: 20),
                decoration: InputDecoration(
                    hintText: "Enter Tag2",
                    hintStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: tag3,
                style: TextStyle(fontFamily: "f2", fontWeight: FontWeight.bold, fontSize: 20),
                decoration: InputDecoration(
                    hintText: "Enter Tag3",
                    hintStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: tag4,
                style: TextStyle(fontFamily: "f2", fontWeight: FontWeight.bold, fontSize: 20),
                decoration: InputDecoration(
                    hintText: "Enter Tag4",
                    hintStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: tag5,
                style: TextStyle(fontFamily: "f2", fontWeight: FontWeight.bold, fontSize: 20),
                decoration: InputDecoration(
                    hintText: "Enter Tag5",
                    hintStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () async{
                  addData();

                },
                child: Text("Save" ,style: TextStyle(fontWeight: FontWeight.bold ,fontFamily:  "f2", fontSize: 30),),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  fixedSize: Size(150, 60),
                ),
              ),
            )


          ],
        ),
      ),
    );
  }








}
