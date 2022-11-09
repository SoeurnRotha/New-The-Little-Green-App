import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/popular_product_model.dart';


class PopularHepler{
  Stream<QuerySnapshot <Map<String,dynamic>>> read(){
    return FirebaseFirestore.instance.collection(PopularModel.collectionName).snapshots();
  }
}