import 'package:cloud_firestore/cloud_firestore.dart';
class IndoorModel{
  static const String collectionName = "Indoor";
  static const String imageProductString = "image";
  static const String nameProductString = "name";
  static const String priceProductString = "price";
  static const String productInfo = "proInfo";
  static const String descriptionInfo = "desInfo";


  late String proInfo;
  late String desInfo;
  late String image;
  late String name;
  late String price;
  DocumentReference reference;



  IndoorModel({this.image="no image", this.name = "no name", this.price= "no price",required this.reference,this.proInfo="no info",this.desInfo = "no info"});


  IndoorModel.fromMap(Object ? object , {required this.reference}){
    Map<String,dynamic>? map = object as Map<String,dynamic>?;
    image = (map ?? {})[imageProductString] ?? "no image";
    name = (map ?? {})[nameProductString] ?? "no name";
    price = (map ?? {})[priceProductString] ?? "no price";
    proInfo = (map ?? {})[productInfo] ?? "no info";
    desInfo = (map ?? {})[descriptionInfo] ?? "no info";
  }

  IndoorModel.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);




  Map<String ,dynamic> get toMap => {
    imageProductString: image,
    nameProductString: name,
    priceProductString: price,
    productInfo: proInfo,
    descriptionInfo: desInfo,

  };


}