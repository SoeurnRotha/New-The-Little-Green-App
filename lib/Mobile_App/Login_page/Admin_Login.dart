import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../Admin/admin_helper/login_helper.dart';
class Login_Admin extends StatefulWidget {
  const Login_Admin({Key? key}) : super(key: key);

  @override
  State<Login_Admin> createState() => _Login_AdminState();
}

class _Login_AdminState extends State<Login_Admin> {

   AuthHelper authHelper = AuthHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody,
    );
  }
  get _buildBody{
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            width: 350,
            height: 350,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/intro/logo.png"),
                    fit: BoxFit.cover
                )
            ),
            child: Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(bottom: 20),
                child: Text("Welcome To Admin",style: TextStyle(fontFamily:"f2" ,fontSize: 30,fontWeight: FontWeight.bold),)

            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15,left: 15,top: 8,bottom: 8),
            child: TextField(
              controller: authHelper.Adminemail,
              style: TextStyle(fontSize: 18,fontFamily: "f2"),
              decoration: InputDecoration(
                hintText: "Email",
                hintStyle: TextStyle(fontSize: 18,fontFamily: "f2"),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15,left: 15,top: 8,bottom: 8),
            child: TextField(
              controller: authHelper.Adminpassword,
              style: TextStyle(fontSize: 18,fontFamily: "f2"),
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: TextStyle(fontSize: 18,fontFamily: "f2"),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),

              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20,left: 20,top: 8,bottom: 8),
            child: ElevatedButton(
              onPressed: ()async{
                if(authHelper.Adminemail !="" &&authHelper.Adminpassword != ""){
                  authHelper.AdminLogin(context);

                }
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                fixedSize: Size(MediaQuery.of(context).size.width, 60),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              child: Text("Login admin",style: TextStyle(fontSize: 20,fontFamily: "f1",fontWeight: FontWeight.bold),),
            ),
          )
        ],
      ),
    );
  }
}
