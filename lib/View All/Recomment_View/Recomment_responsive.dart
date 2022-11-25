import 'package:flutter/cupertino.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'Recomment_view_Mobile.dart';
import 'Recomment_view_Tablat.dart';
import 'Recomment_view_Web.dart';

class Recomment_viewAll extends StatefulWidget {
  const Recomment_viewAll({Key? key}) : super(key: key);

  @override
  State<Recomment_viewAll> createState() => _Recomment_viewAllState();
}

class _Recomment_viewAllState extends State<Recomment_viewAll> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: Recomment_view_Mobile(),
      tablet: Recomment_view_Tablat(),
      desktop: Recomment_view_Web(),
    );
  }
}
