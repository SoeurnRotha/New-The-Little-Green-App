import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_little_green_product_e_com/favorite/favorite.dart';
import 'package:the_little_green_product_e_com/screen/About%20US.dart';
import 'package:the_little_green_product_e_com/screen/Seetting_Page.dart';

import '../Login_page/Profile_User_Upload.dart';
import '../Login_page/login_page.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
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
  final _bucket = PageStorageBucket();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  Widget build(BuildContext context) {
    return PageStorage(
      bucket: _bucket,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: ListView(
          key: PageStorageKey<String> ("Profile"),
          physics: BouncingScrollPhysics(),
          children: [
            _buildGetDataUser_Profile,
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> About_Us_Page())),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey
                  ),
                  child: ListTile(
                    leading: Icon(Icons.info),
                    title: Text("About US",style: TextStyle(fontSize: 18,fontFamily: "f1",fontWeight: FontWeight.bold),),
                    trailing: Icon(Icons.arrow_forward_ios_outlined),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> FavoriteProduct())),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey
                  ),
                  child: ListTile(
                    leading: Icon(Icons.favorite),
                    title: Text("Favorite",style: TextStyle(fontSize: 18,fontFamily: "f1",fontWeight: FontWeight.bold),),
                    trailing: Icon(Icons.arrow_forward_ios_outlined),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: InkWell(
                onTap:()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> SeettingPage())),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey
                  ),
                  child: ListTile(
                    leading: Icon(Icons.settings),
                    title: Text("Seetting",style: TextStyle(fontSize: 18,fontFamily: "f1",fontWeight: FontWeight.bold),),
                    trailing: Icon(Icons.arrow_forward_ios_outlined),
                  ),
                ),
              ),
            ),
           Padding(
             padding: const EdgeInsets.all(15.0),
             child: InkWell(
               onTap: () async{
                 final FirebaseAuth _auth = FirebaseAuth.instance;
                 try {

                   await showDialog(context: context, builder: (BuildContext context){
                     return AlertDialog(
                       title: Text("Logout",style: TextStyle(fontSize: 18,fontFamily: "f2",fontWeight: FontWeight.bold),),
                       content: Text("Do you want to Logout?",style: TextStyle(fontFamily: "f2",fontSize: 17,),),
                       actions: [
                         ElevatedButton(
                           onPressed: (){
                             Navigator.pop(context);
                           },
                           child: Text("Cencel" ,style: TextStyle(fontSize: 16,fontFamily: "f1",fontWeight: FontWeight.bold),),
                         ),
                         ElevatedButton(
                           onPressed: () async{
                             await _auth.signOut();
                             Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                           },
                           child: Text("Logout",style: TextStyle(fontFamily: "f1", fontSize: 16,fontWeight: FontWeight.bold),),
                         ),
                       ],
                     );
                   });
                 } catch (e) {
                   print('can not signOut as : $e');
                 }

               },
               child: Container(
                 height: 60,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10),
                   color: Colors.white,
                   boxShadow: [
                     BoxShadow(
                       spreadRadius: 2,
                       color: Colors.red,

                     )
                   ]
                 ),
                 child: Center(
                   child: Text("Logout",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,fontFamily: "f1",color: Colors.red),),
                 ),
               ),
             ),
           )
          ],
        ),
      ),
    );
  }

  get _buildGetDataUser_Profile{
    return Container(
      height: 180,
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(

              backgroundImage: NetworkImage(imagePic) ?? getImageProfile(),
              radius: 50,
              backgroundColor: Colors.grey,

            ),
            SizedBox(width: 30,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(name,style: TextStyle(fontSize: 18,fontFamily: "f1",fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Profile_user_upload()));
                  },
                  child: Container(
                    width: 150,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.purple,
                          spreadRadius: 3,
                          blurStyle: BlurStyle.solid,
                        )
                      ]
                    ),
                    child: Center(
                      child: Text("Edit profile",style: TextStyle(fontSize: 16,fontFamily: "f1",fontWeight: FontWeight.bold),),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
