import 'package:flutter/cupertino.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'Outdoor_view_Mobile.dart';
import 'Outdoor_view_Tablat.dart';
import 'Outdoor_view_Web.dart';



class Outdoor_viewAll extends StatefulWidget {
  const Outdoor_viewAll({Key? key}) : super(key: key);

  @override
  State<Outdoor_viewAll> createState() => _Outdoor_viewAllState();
}

class _Outdoor_viewAllState extends State<Outdoor_viewAll> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: Outdoor_view_Mobile(),
      tablet: Outdoor_view_Tablat(),
      desktop: Outdoor_view_Web(),
    );
  }
}
