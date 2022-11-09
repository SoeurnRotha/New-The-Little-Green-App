import 'package:cloud_firestore/cloud_firestore.dart';


import '../model/Sllider_product_model.dart';

class SliderHelper{
  Stream<QuerySnapshot <Map<String,dynamic>>> read(){
    return FirebaseFirestore.instance.collection(SliderProductModel.collectionName).snapshots();
  }
}