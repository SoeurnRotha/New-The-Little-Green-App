
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class InsertData_Slider extends StatefulWidget {
  const InsertData_Slider({Key? key}) : super(key: key);

  @override
  State<InsertData_Slider> createState() => _InsertData_SliderState();
}

class _InsertData_SliderState extends State<InsertData_Slider> {
  final productController = TextEditingController();
  final descriptionController = TextEditingController();
  final nameController = TextEditingController();
  final priceController = TextEditingController();

  //add data to firestore
  CollectionReference collectionReference = FirebaseFirestore.instance.collection("Slider");

  void addData() async{
    final imageURL = await uploadImage(_image!);
    collectionReference.add({
      "image": imageURL,
      "name" : nameController.text.trim(),
      "price" : priceController.text,
      "proInfo" : productController.text,
      "desInfo" : descriptionController.text,
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
    Reference ref =  FirebaseStorage.instance.ref().child('Slider').child('Slider product $imgId');
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
        title: Text("Insert Data to Slider", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold , fontFamily: "f1", color: Colors.black),),

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
