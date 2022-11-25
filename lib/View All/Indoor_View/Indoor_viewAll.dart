import 'package:flutter/cupertino.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'Indoor_view_Mobile.dart';
import 'Indoor_view_Tablat.dart';
import 'Indoor_view_Web.dart';




class Indoor_viewAll extends StatefulWidget {
  const Indoor_viewAll({Key? key}) : super(key: key);

  @override
  State<Indoor_viewAll> createState() => _Indoor_viewAllState();
}

class _Indoor_viewAllState extends State<Indoor_viewAll> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: Indoor_view_Mobile(),
      tablet: Indoor_view_Tablat(),
      desktop: Indoor_view_Web(),
    );
  }
}
