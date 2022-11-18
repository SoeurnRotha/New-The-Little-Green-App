import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../Model/bast_model_getx.dart';
import '../Model/popular_model_getx.dart';


class HomeController extends GetxController{

  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;


  late List<Popular_model_getx> popular_product ;
  late List<Bast_model_getx> bast_product ;

  bool isLoadding= true;

  void getAllData() async{
    await Future.wait([
      getDataFromBastProduct(),
      getDataFromPopularProduct()
    ]).then((value) {
      print(value);
      isLoadding = false;
      update();
    });
  }

  Future<void> getDataFromPopularProduct() async{

    await firebaseFirestore.collection("Popular").get().then((value) {
      popular_product = value.docs.map((e) => Popular_model_getx.fromJson(e.data())).toList();

    });


  }
  Future<void> getDataFromBastProduct() async{

    await firebaseFirestore.collection("BastProducts").get().then((value) {
      bast_product = value.docs.map((e) => Bast_model_getx.fromJson(e.data())).toList();

    });


  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllData();
  }
}