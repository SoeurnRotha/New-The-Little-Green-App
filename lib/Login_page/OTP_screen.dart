import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:quickalert/quickalert.dart';

import '../screen/home_page.dart';
import 'login_page.dart';


class OTP_screen extends StatefulWidget {
  const OTP_screen({Key? key}) : super(key: key);

  @override
  State<OTP_screen> createState() => _OTP_screenState();
}

class _OTP_screenState extends State<OTP_screen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var code = "";
  @override
  Widget build(BuildContext context) {


    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(fontSize: 30, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(10),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );


    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [ 
              Text("OTP Verifycation", style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,fontFamily: "f1"),),
              SizedBox(height: 10,),
              Text("You will get to a OTP via SMS", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: "f1"),),
              Container(
                width: 250,
                height: 250,
                child: Image.asset("images/intro/otp.png")
              ),


              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Pinput(
                  defaultPinTheme: defaultPinTheme,
                  length: 6,
                  showCursor: true,
                  onChanged: (value){
                    code = value;
                  },
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.of(context).size.width, 55),
                    primary: Colors.greenAccent[400],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                  ),
                  onPressed: () async{
                    try{
                      PhoneAuthCredential credential = PhoneAuthProvider.credential(
                          verificationId: LoginPage.verify
                          , smsCode: code);
                      await _auth.signInWithCredential(credential);

                      //loadding
                      await QuickAlert.show(
                          context: context,
                          type: QuickAlertType.success
                      );

                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> HomePage()), (route) => false);



                    }catch(e){
                      await QuickAlert.show(
                          context: context,
                          type: QuickAlertType.error
                      );
                      print(e);
                    }
                  },
                  child: Text("Verify Code",style: TextStyle(fontFamily: "f2",fontSize: 18,fontWeight: FontWeight.bold),),
                ),
              ),
              TextButton(
                  onPressed: ()=> Navigator.pop(context)
                  ,child: Text("Edit Phone Number ?", style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "f1",fontSize: 15),)
              ),
            ],
          ),
        ),
      ),
    );
  }
}
