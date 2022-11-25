import 'package:flutter/cupertino.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'Popular_view_Mobile.dart';
import 'Popular_view_Tablat.dart';
import 'Popular_view_Web.dart';


class Popular_viewAll extends StatefulWidget {
  const Popular_viewAll({Key? key}) : super(key: key);

  @override
  State<Popular_viewAll> createState() => _Popular_viewAllState();
}

class _Popular_viewAllState extends State<Popular_viewAll> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: Popular_view_Mobile(),
      tablet: Popular_view_Tablat(),
      desktop: Popular_view_Web(),
    );
  }
}
