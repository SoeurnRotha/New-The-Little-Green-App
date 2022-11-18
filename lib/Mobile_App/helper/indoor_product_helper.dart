import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/indoor_product_model.dart';



class IndoorHepler{
  Stream<QuerySnapshot <Map<String,dynamic>>> read(){
    return FirebaseFirestore.instance.collection(IndoorModel.collectionName).snapshots();
  }
}