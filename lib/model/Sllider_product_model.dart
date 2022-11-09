import 'package:cloud_firestore/cloud_firestore.dart';
class SliderProductModel{
  static const String collectionName = "Slider";
  static const String imageProductString = "image";
  late String image;
  DocumentReference reference;
  SliderProductModel({this.image="no image",required this.reference});
  SliderProductModel.fromMap(Object ? object , {required this.reference}){
    Map<String,dynamic>? map = object as Map<String,dynamic>?;
    image = (map ?? {})[imageProductString] ?? "no image";

  }

  SliderProductModel.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);




  Map<String ,dynamic> get toMap => {
    imageProductString: image,


  };


}