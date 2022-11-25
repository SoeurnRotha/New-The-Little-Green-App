import 'package:flutter/cupertino.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'Bast_view_Mobile.dart';
import 'Bast_view_Tablat.dart';
import 'Bast_view_Web.dart';



class Bast_viewAll extends StatefulWidget {
  const Bast_viewAll({Key? key}) : super(key: key);

  @override
  State<Bast_viewAll> createState() => _Bast_viewAllState();
}

class _Bast_viewAllState extends State<Bast_viewAll> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: Bast_view_Mobile(),
      tablet: Bast_view_Tablat(),
      desktop: Bast_view_Web(),
    );
  }
}
