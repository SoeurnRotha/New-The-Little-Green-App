import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/outdoor_product_model.dart';

class OutdoorHelper{
  Stream<QuerySnapshot <Map<String,dynamic>>> read(){
    return FirebaseFirestore.instance.collection(OutdoorModel.collectionName).snapshots();
  }
}