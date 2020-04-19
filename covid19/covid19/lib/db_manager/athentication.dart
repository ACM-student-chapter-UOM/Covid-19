import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import "../screens/homepage.dart";
import '../components/app_bar.dart';
import '../components/text.dart';
import '../components/button.dart';
import '../components/textform.dart';


class AuthenticationManager {
  Future<bool> loginUser(String phone, BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    final _codeController = TextEditingController();
    _auth.verifyPhoneNumber(
      phoneNumber: phone,
      timeout: Duration(seconds: 110),
      verificationCompleted: (AuthCredential credential) async {
        Navigator.of(context).pop();

        AuthResult result = await _auth.signInWithCredential(credential);

        FirebaseUser user = result.user;

        if (user != null) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => WelcomeScreen()));
        } else {
          print("Error");
        }

        //This callback would gets called when verification is done auto maticlly
      },
      verificationFailed: (AuthException exception) {
        print(exception.message);
        print('exception');
      },
      
      codeSent: (String verificationId, [int forceResendingToken]) {
          var appBar = AppBar(
            title: AppBarTitle(),
            automaticallyImplyLeading: false,
            centerTitle: true,
          );
     
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return Scaffold(
          appBar: appBar,   
          body: Container(
                
                child: Column(
                  
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children:<Widget>[
                    SizedBox(
                          height: 16,
                        ),
                    Form(
                    child: Column(

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: <Widget>[
                        SizedBox(
                          height: 16,
                        ),
                        TextBoldWidget(color: Theme.of(context).primaryColor, text:"ENTER THE OTP SENT TO YOU",fontsize: 20,), 

                        SizedBox(
                          height: 10,
                        ),

                        TextBoldWidget(color: Theme.of(context).primaryColor, text:phone,fontsize: 20,), 

                        UnderlinedButtonWidget(onPressed: ()=>{},text: "CHANGE THE PHONE NUMBER",),
                        
                        SizedBox(
                          height: 16,
                        ),

                        TextField(
                          controller: _codeController,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextBoldWidget(color: Colors.black,text: "IF THE OTP IS NOT RECIEVED", fontsize: 20,),

                        UnderlinedButtonWidget(onPressed: ()=>{},text: "RESEND THE CODE",),

                      
                      ],
                    ),
                  ),
                    
                    Column(
                      children: <Widget>[
                    
                        SizedBox(height: 10,),

                        ButtonWidget(
                          onPressed: () async {
                          final code = _codeController.text.trim();
                          AuthCredential credential =
                              PhoneAuthProvider.getCredential(
                                  verificationId: verificationId, smsCode: code);

                          AuthResult result =
                              await _auth.signInWithCredential(credential);

                          FirebaseUser user = result.user;

                          if (user != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WelcomeScreen(),
                              ),
                            );
                          } else {
                            print("Error");
                          }
                        },
                          text: "LOGIN",
                        ),
                        SizedBox(height: 10,),
                      ]
                    )
                        
                  
                  ]
                ),
              ),
            );
 });
      },
      codeAutoRetrievalTimeout: (String msg) {
        // print("TIMEOUT");
        Navigator.of(context).pop();
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                title: Text("TIMEOUT"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text("Back"),
                    textColor: Colors.white,
                    color: Colors.blue,
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  ),
                  FlatButton(
                    child: Text("Resend"),
                    textColor: Colors.white,
                    color: Colors.blue,
                    onPressed: () async {
                      await this.loginUser(phone, context);
                    },
                  )
                ],
              );
            });
      },
    );
  }
}
