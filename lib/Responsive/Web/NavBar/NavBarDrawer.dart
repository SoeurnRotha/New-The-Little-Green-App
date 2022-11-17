import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_little_green_product_e_com/Responsive/Web/NavBar/DrawerItems.dart';

class NavBarDrawer extends StatefulWidget {

  const NavBarDrawer({Key? key}) : super(key: key);

  @override
  State<NavBarDrawer> createState() => _NavBarDrawerState();
}

class _NavBarDrawerState extends State<NavBarDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
     color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DrawerItem(title: 'App', icon: Icons.apps),
          DrawerItem(title: 'About us', icon: Icons.info),
          DrawerItem(title: 'Contacte', icon: Icons.call),
        ],
      ),
    );
  }
}
