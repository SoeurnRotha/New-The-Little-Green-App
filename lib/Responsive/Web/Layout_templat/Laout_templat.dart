import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:responsive_builder/responsive_builder.dart';
import 'package:the_little_green_product_e_com/Responsive/Web/NavBar/NavBar.dart';
import 'package:the_little_green_product_e_com/Responsive/Web/Route/location.dart';

import '../NavBar/NavBarDrawer.dart';
import '../Navigator_server/Navigator_server.dart';

class LayoutTemplat extends StatefulWidget {
  const LayoutTemplat({Key? key}) : super(key: key);

  @override
  State<LayoutTemplat> createState() => _LayoutTemplatState();
}

class _LayoutTemplatState extends State<LayoutTemplat> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context ,size) => Scaffold(
        drawer: size.deviceScreenType == DeviceScreenType.mobile ? NavBarDrawer() : null,
        body: Column(
          children: [
            NavBar(
              key: location<Navigator_server>().navigatorKey,
              
            ),

          ],
        )
      ),
    );
  }
}
