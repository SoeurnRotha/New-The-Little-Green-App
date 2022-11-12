import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';





import '../helper/google_helper.dart';
import '../helper/snackBar.dart';
import '../screen/home_page.dart';
import 'Admin_Login.dart';
import 'OTP_screen.dart';
import 'Profile_User_Upload.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static String verify = "";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _phoneNumber = TextEditingController();
  TextEditingController _countryCode = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var phone = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _countryCode.text = "+855";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody,
    );
  }
  GoogleHelper _googleHelper = GoogleHelper();

  get _buildBody{
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [

          Container(
            margin: EdgeInsets.only(left: 150),
            alignment: Alignment.topRight,
            width: 200,
            height: 200,
            child: Image.asset("images/Welcome/03.png"),
          ),
          Container(
            margin: EdgeInsets.only(right: 150),
            alignment: Alignment.topLeft,
            width: 200,
            height: 200,
            child: Image.asset("images/Welcome/02.png"),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10,),
              Text("Welcome",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,fontFamily: "f1",letterSpacing: 10),),
              SizedBox(height: 10,),
              Text("The Little Green",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,fontFamily: "f1",letterSpacing: 5),),
              SizedBox(height: 10,),
              Text("Please Login account to continue",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,fontFamily: "f1",color: Colors.grey),),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1,color: Colors.grey)
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12,bottom: 11,top: 10),
                        child: SizedBox(
                          width: 60,
                          child: TextField(
                            style: TextStyle(fontFamily: "f1",fontSize: 20,fontWeight: FontWeight.bold),
                            controller: _countryCode,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintStyle: TextStyle(fontSize: 20)
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("|",style: TextStyle(fontSize: 40,color: Colors.grey),),
                      SizedBox(width: 20,),
                      Expanded(
                        child: TextField(
                          style: TextStyle(fontFamily: "f1", fontSize: 20, fontWeight: FontWeight.bold),
                          controller: _phoneNumber,
                          keyboardType: TextInputType.phone,

                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Phone",
                            hintStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, fontFamily: "f1"),
                          ),
                          onChanged: (value){
                            phone= value;
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 25,right: 25,bottom: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.of(context).size.width, 40),
                    primary: Colors.lightGreenAccent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: ()async{
                    //loading
                    // showDialog(context: context, builder: (context){
                    //   return AlertDialog(
                    //     title: Center(child: CircularProgressIndicator(),),
                    //   );
                    // });
                     QuickAlert.show(context: context, type: QuickAlertType.loading);
                    await FirebaseAuth.instance.verifyPhoneNumber(
                        phoneNumber: "${_countryCode.text + phone}",
                        verificationCompleted: (PhoneAuthCredential credential){

                        }, verificationFailed: (FirebaseAuthException e){
                    }, codeSent: (String verifycationId, int? resendToken){
                      LoginPage.verify = verifycationId;
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> OTP_screen()));
                    }, codeAutoRetrievalTimeout: (String verifycationId){}
                    );


                  },
                  child: Text("Sent Code",style: TextStyle(fontFamily: "f1",fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),),
                ),
              ),

              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 25,right: 25,bottom: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.of(context).size.width, 40),
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () async{

                    bool result = await _googleHelper.signInWithGoogle();

                    if(result){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage()));
                    }else{
                      showSnackBar(context, "Google login failed!");
                    }

                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      Container(
                        width: 80,
                        height: 80,
                        child: Image.asset("images/intro/google.png"),
                      ),
                      Text("Sign with Google",style: TextStyle(fontFamily: "f1",fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),),
                    ],
                  ),
                ),
              ),


              Text("By sign in you are agreeing to our",style: TextStyle(fontSize: 18,fontFamily: "f1",),),
              SizedBox(height: 10,),
              Text("Tems and Pricacy Policy",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, fontFamily: "f1"),),
              MaterialButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Login_Admin()));
                  },
                  child: Text("Login by admin page", style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue,fontFamily: "f1",fontSize: 20)
                  )
              ),
            ],
          ),
        ],
      )

    );

  }


}
