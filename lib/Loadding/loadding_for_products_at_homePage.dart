import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoaddingProduct extends StatefulWidget {
  const LoaddingProduct({Key? key}) : super(key: key);

  @override
  State<LoaddingProduct> createState() => _LoaddingProductState();
}

class _LoaddingProductState extends State<LoaddingProduct> {
  @override
  Widget build(BuildContext context) {
    return _buildRow;
  }

  Widget _itemLoadding(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.white,
        child: Container(
          height: 250,
          width: 180,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[100]
          ),
        ),
      ),
    );
  }

  Widget get _buildRow{
    return Container(
      height: 300,
      width: 500,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _itemLoadding(),
          _itemLoadding(),
          _itemLoadding(),
          _itemLoadding(),
          _itemLoadding(),
        ],
      ),
    );
  }
}
