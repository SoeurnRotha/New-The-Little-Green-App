import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import '../model/CartModel.dart';
class CartHelper{
  Stream<QuerySnapshot <Map<String,dynamic>>> read(){
    return FirebaseFirestore.instance.collection(CartModel.collectionName).doc(FirebaseAuth.instance.currentUser!.uid).collection("items").snapshots();
  }
}