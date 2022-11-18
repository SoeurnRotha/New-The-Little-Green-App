import 'package:cloud_firestore/cloud_firestore.dart';
class BastProductModel{
  static const String collectionName = "BastProducts";
  static const String imageProductString = "image";
  static const String nameProductString = "name";
  static const String priceProductString = "price";
  static const String productInfo = "proInfo";
  static const String descriptionInfo = "desInfo";

  late String image;
  late String name;
  late String price;
  DocumentReference reference;
  late String proInfo;
  late String desInfo;



  BastProductModel({this.image="no image", this.name = "no name", this.price= "no price",required this.reference, this.proInfo ="no info", this.desInfo = "no info"});


  BastProductModel.fromMap(Object ? object , {required this.reference}){
    Map<String,dynamic>? map = object as Map<String,dynamic>?;
    image = (map ?? {})[imageProductString] ?? "no image";
    name = (map ?? {})[nameProductString] ?? "no name";
    price = (map ?? {})[priceProductString] ?? "no price";
    proInfo = (map ?? {})[productInfo] ?? "no info";
    desInfo = (map ?? {})[descriptionInfo] ?? "no info";
  }

  BastProductModel.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);




  Map<String ,dynamic> get toMap => {
    imageProductString: image,
    nameProductString: name,
    priceProductString: price,
    productInfo: proInfo,
    descriptionInfo: desInfo,

  };


}