import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoaddingSearchProducts extends StatefulWidget {
  const LoaddingSearchProducts({Key? key}) : super(key: key);

  @override
  State<LoaddingSearchProducts> createState() => _LoaddingSearchProductsState();
}

class _LoaddingSearchProductsState extends State<LoaddingSearchProducts> {
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
          height: 200,
          width: MediaQuery.of(context).size.width,
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
      child: ListView(
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
