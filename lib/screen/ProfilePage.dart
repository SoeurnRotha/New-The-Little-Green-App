import 'package:flutter/material.dart';
import 'package:the_little_green_product_e_com/screen/Seetting_Page.dart';

import '../Login_page/Profile_User_Upload.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          _buildGetDataUser_Profile,
          Padding(
            padding: const EdgeInsets.all(15.0),
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
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey
              ),
              child: ListTile(
                leading: Icon(Icons.call),
                title: Text("Call",style: TextStyle(fontSize: 18,fontFamily: "f1",fontWeight: FontWeight.bold),),
                trailing: Icon(Icons.arrow_forward_ios_outlined),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
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
         )
        ],
      ),
    );
  }

  get _buildGetDataUser_Profile{
    return Container(
      height: 180,
      color: Colors.lightGreenAccent,
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue,
            ),
            SizedBox(width: 30,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("User Name",style: TextStyle(fontSize: 18,fontFamily: "f1",fontWeight: FontWeight.bold),),
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
