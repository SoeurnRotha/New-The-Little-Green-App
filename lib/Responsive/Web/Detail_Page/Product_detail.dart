import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class DetailProduct extends StatefulWidget {
  const DetailProduct({Key? key, required this.image, required this.name, required this.price, required this.proInfo, required this.desInfo}) : super(key: key);
  final String image;
  final String name;
  final String price;
  final String proInfo;
  final String desInfo;

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}
