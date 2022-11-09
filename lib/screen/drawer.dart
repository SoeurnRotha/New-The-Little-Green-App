import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Login_page/Profile_User_Upload.dart';
import '../Login_page/login_page.dart';
import '../favorite/favorite.dart';


class drawer extends StatefulWidget {
  const drawer({Key? key}) : super(key: key);

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  getImageProfile(){
    if(_firebaseAuth.currentUser?.photoURL != null){
      return NetworkImage("${_firebaseAuth.currentUser?.photoURL}");
    }else{
      return Icon(Icons.account_circle,size: 50,);
    }
  }
  String imagePic = "no image";
  String name = "no name";
  String email = "no email";
  FirebaseAuth _auth = FirebaseAuth.instance;
  void getData() async{
    User? user = await _auth.currentUser;
    var data = await FirebaseFirestore.instance.collection('user').doc(user!.uid).get();
    setState((){
      imagePic = data.data()!['profilePic'];
      name = data.data()!['name'];
      email = data.data()!['email'];
    });




  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override

  Widget build(BuildContext context) {
    getData();
    return Drawer(
      child: ListView(
        children: [
          //user data with phone number
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.grey),
            currentAccountPicture:
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(imagePic,),
            ),
              accountName: Text(name),
              accountEmail: Text(email)
          ),
          // Container(
          //   height: 200,
          //   color: Colors.grey,
          //   child: _auth.currentUser!.uid != null ?  Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       //image user
          //       SizedBox(height: 20,),
          //       Container(
          //         width: 100,
          //         height: 100,
          //         decoration: BoxDecoration(
          //             shape: BoxShape.circle,
          //             image: DecorationImage(
          //                 image: getImageProfile(),
          //                 fit: BoxFit.cover
          //             )
          //         ),
          //       ),
          //       SizedBox(height: 20,),
          //       Text("${_firebaseAuth.currentUser?.email}", style: TextStyle(fontSize: 18, fontFamily: "f1", fontWeight: FontWeight.bold),),
          //
          //     ],
          //   ) : Container(color: Colors.red,),
          // ),


          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text("Profile"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Profile_user_upload()));
            },
          ),

          ListTile(
            leading: Icon(Icons.favorite),
            title: Text("Favorite"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> FavoriteProduct()));
            },
          ),

          ListTile(
            leading: Icon(Icons.info),
            title: Text("About us"),
            onTap: (){

            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),

            onTap: () async{
              final FirebaseAuth _auth = FirebaseAuth.instance;
              try {
                await _auth.signOut();
                await showDialog(context: context, builder: (BuildContext context){
                 return AlertDialog(
                    title: Text("Logout"),
                    content: Text("Do you want to Logout?"),
                    actions: [
                      ElevatedButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        child: Text("Cencel"),
                      ),
                      ElevatedButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                        },
                        child: Text("Logout",style: TextStyle(color: Colors.red),),
                      ),
                    ],
                  );
                });
              } catch (e) {
                print('can not signOut as : $e');
              }

            },
          ),

        ],
      ),

    );
  }
}
