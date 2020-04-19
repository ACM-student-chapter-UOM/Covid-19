import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import "../screens/homepage.dart";

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
          debugPrint("Error");
        }

        //This callback would gets called when verification is done auto maticlly
      },
      verificationFailed: (AuthException exception) {
        debugPrint(exception.message);
        debugPrint('exception');
      },
      codeSent: (String verificationId, [int forceResendingToken]) {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                title: Text("Give the code?"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextField(
                      controller: _codeController,
                    ),
                  ],
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text("Confirm"),
                    textColor: Colors.white,
                    color: Colors.blue,
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
                        debugPrint("Error");
                      }
                    },
                  )
                ],
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
