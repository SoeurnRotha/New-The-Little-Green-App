import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'Bast_Mobile.dart';
import 'Bast_Tablat.dart';
import 'Bast_Web.dart';

class Bast_web extends StatefulWidget {
  const Bast_web({Key? key}) : super(key: key);

  @override
  State<Bast_web> createState() => _Bast_webState();
}

class _Bast_webState extends State<Bast_web> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: Bast_Mobile(),
      tablet: Bast_Tablat(),
      desktop: Bast_Web(),
    );
  }
}
