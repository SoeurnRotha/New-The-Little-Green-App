import 'package:cloud_firestore/cloud_firestore.dart';

class CartModel {
  static const String collectionName = "AddCart";
  static const String imageProduct = "image";
  static const String nameProduct = "name";
  static const String priceProduct = "price";
  static const String proInfoProduct = "proInfo";
  static const String desInfoProduct = "desInfo";
  static const String qtyProduct = "QTY";
  static const String totalProduct = "total";

  late String image;
  late String name;
  late String price;
  DocumentReference reference;
  late String proInfo;
  late String desInfo;
  late int qty;
  late double total;

  CartModel({
    this.image = "no image",
    this.name = "no name",
    this.price = "no price",
    this.proInfo = "no pro",
    this.desInfo = "no des",
    this.qty = 0,
    this.total = 0.0,
    required this.reference
  });

  CartModel.fromMap(Object ? object , {required this.reference}){
    Map<String,dynamic>? map = object as Map<String,dynamic>?;
    image = (map ?? {})[imageProduct] ?? "no image";
    name = (map ?? {})[nameProduct] ?? "no name";
    price = (map ?? {})[priceProduct] ?? "no price";
    proInfo = (map ?? {})[proInfoProduct] ?? "no info";
    desInfo = (map ?? {})[desInfoProduct] ?? "no info";
    qty = (map ?? {})[qtyProduct] ?? 0;
    total = (map ?? {})[totalProduct] ?? 0.0;
  }

  CartModel.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  Map<String ,dynamic> get toMap => {
    imageProduct: image,
    nameProduct: name,
    priceProduct: price,
    proInfoProduct: proInfo,
    desInfoProduct: desInfo,
    qtyProduct: qty,
    totalProduct: total
  };

}