import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../screens/verificationpage.dart';

class AuthenticationManager {
  Future<bool> loginUser(String phone, BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    _auth.verifyPhoneNumber(
      phoneNumber: phone,
      timeout: Duration(seconds: 60),
      verificationCompleted: (AuthCredential credential) async {
        Navigator.of(context).pop();

        AuthResult result = await _auth.signInWithCredential(credential);

        FirebaseUser user = result.user;

        if (user != null) {
          Navigator.pushReplacementNamed(context, 'permission');
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
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return VerificationPage(verificationId: verificationId);
            });
      },
      codeAutoRetrievalTimeout: (String msg) {
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
