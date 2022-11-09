
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Login_page/login_page.dart';
import '../Home_Admin.dart';

class AuthHelper {
  final auth = FirebaseAuth.instance;

  TextEditingController Adminemail = TextEditingController();
  TextEditingController Adminpassword = TextEditingController();
  final firestore = FirebaseFirestore.instance;
  void AdminLogin(context) async{
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Center(child: CircularProgressIndicator(),),
      );
    });
    await FirebaseFirestore.instance.collection("Admin").doc("adminLogin").snapshots().forEach((element) {
      if(element.data() ?['adminEmail'] == Adminemail.text && element.data() ?['adminPassword'] == Adminpassword.text){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Admin_Home()));
      }
    }).catchError((e){
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Text("Error"),
          content: Text(e.toString()),
        );
      });
    });
  }

  void logout(context) async{
    auth.signOut();
    Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
  }
}