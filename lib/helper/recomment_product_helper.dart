import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


import '../model/recomment_product_model.dart';

class RecommentHepler{
  Stream<QuerySnapshot <Map<String,dynamic>>> read(){
    return FirebaseFirestore.instance.collection(RecommentProductModel.collectionName).snapshots();
  }
}