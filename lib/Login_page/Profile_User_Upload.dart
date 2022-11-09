import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../screen/home_page.dart';


class Profile_user_upload extends StatefulWidget {
  const Profile_user_upload({Key? key}) : super(key: key);

  @override
  State<Profile_user_upload> createState() => _Profile_user_uploadState();
}

class _Profile_user_uploadState extends State<Profile_user_upload> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController homeNumberController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  String? profilePic;
  String? downloadURL;
  bool isSave = false;
  Future<String?> uploadImage(File filepath, String? ref) async{
    try{
      final fileName = '${FirebaseAuth.instance.currentUser!.uid}${DateTime.now()}';
      final Reference reference = FirebaseStorage.instance.ref(ref).child(fileName);
      final UploadTask uploadTask = reference.putFile(filepath);
      await uploadTask.whenComplete(() async{
        downloadURL = await reference.getDownloadURL();

      });
      return downloadURL;
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  saveInfo(){
    setState((){
      isSave = true;
    });
    uploadImage(File(profilePic!), 'profile').whenComplete(() {
      Map<String ,dynamic> data = {
        'name' : nameController.text,
        'phone' : phoneController.text,
        'home' : homeNumberController.text,
        'street' : streetController.text,
        'city' : cityController.text,
        'address' : addressController.text,
        'profilePic' : downloadURL,
        'email': emailController.text

      };
      FirebaseFirestore.instance.collection("user").doc(FirebaseAuth.instance.currentUser!.uid).set(data).whenComplete(() {
        FirebaseAuth.instance.currentUser!.updateDisplayName(nameController.text);
        setState((){
          isSave = false;
        });
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.green,content: Text("Save Profile Successful", style: TextStyle(fontSize: 20,fontFamily: "f1",fontWeight: FontWeight.bold),), duration: Duration(seconds: 1),)
      );

       Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: _buildAppbar,
      body: _buildBody,
    );
  }
  get _buildAppbar {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_rounded, size: 30, color: Colors.black,),
        onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage())),
      ),
    );
  }
  get _buildBody{
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            _buildUpload_profile,
            buildTextBox(nameController, "Enter Name"),
            buildTextBox(emailController, "Enter Email"),
            buildTextBox(phoneController, "Enter Phone number"),
            buildTextBox(homeNumberController, "Enter Home number"),
            buildTextBox(streetController, "Enter Street number"),
            buildTextBox(cityController , "Enter City"),
            buildTextBox(addressController, "Enter Address"),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.lightGreenAccent,
                fixedSize: Size(250, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
              ),
              child: Text("Save",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: "f1"),),
              onPressed: (){
                profilePic == null ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.red,content: Text("Sava false",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: "f1"),))) : saveInfo();
              },
            ),

          ],
        ),
      ),
    );
  }
  get _buildUpload_profile{
    return GestureDetector(
      onTap: () async{
        final XFile? pickImage = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 50);
        if(pickImage != null){
          setState((){
            profilePic = pickImage.path;
          });
        }
      },
      child: Container(
        child: profilePic == null ?
        CircleAvatar(
          radius: 70,
          backgroundColor: Colors.grey[300],
          child: Container(width: 60,height: 60,child: Image.asset("images/product/profile.png",fit: BoxFit.cover,)),
        ) :
        CircleAvatar(
          radius: 70,
          backgroundImage: FileImage(File(profilePic!)),

        ),
      ),
    );
  }
  Widget buildTextBox(TextEditingController controller, String text){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,

        style: TextStyle(fontSize: 18,fontFamily: "f1", fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle(fontSize: 18,fontFamily: "f1", fontWeight: FontWeight.bold),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
        ),
      ),
    );
  }
}
