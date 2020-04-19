import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/app_bar.dart';
import '../components/text.dart';
import '../components/button.dart';
import '../components/textform.dart';
import '../utils/constants.dart';
import 'permissionpage.dart';
import 'signup.dart';

// class VerificationPageArguments {
//   final String phonentext;
//   final String verificationId;

//   VerificationPageArguments(this.phonentext,this.verificationId);
// }

class VerificationPage extends StatelessWidget {
  // VerificationPage({@required this.phonentext});
  // final String phonentext;

  static const String id = "verification";
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final TextEditingController _controller5 = TextEditingController();
  final TextEditingController _controller6 = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final verificationId;
  VerificationPage({this.verificationId});

  @override
  Widget build(BuildContext context) {
    Future<void> invalidOTP() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Invalid OTP', style: kOtpErrorDialogBoxTextStyle),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                    'Please enter a valid OTP',
                    style: kOtpErrorDialogBoxTextStyle,
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  'OK',
                  style: kOtpErrorDialogBoxTextStyle,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
            elevation: 10.0,
            backgroundColor: Color(0xff3994c3),
          );
        },
      );
    }
    // final VerificationPageArguments args = ModalRoute.of(context).settings.arguments;

    var appBar = AppBar(
      title: AppBarTitle(),
      centerTitle: true,
    );
    var _pageSize = MediaQuery.of(context).size.height;
    var _notifySize = MediaQuery.of(context).padding.top;
    var _appBarSize = appBar.preferredSize.height;
    return Scaffold(
        appBar: appBar,
        body: SingleChildScrollView(
          child: Container(
            height: _pageSize - (_appBarSize + _notifySize),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
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
                        TextBoldWidget(
                          color: Theme.of(context).primaryColor,
                          text: "ENTER THE OTP SENT TO YOU",
                          fontsize: 20,
                        ),

                        SizedBox(
                          height: 10,
                        ),

                        TextBoldWidget(
                          color: Theme.of(context).primaryColor,
                          text: "1231",
                          fontsize: 20,
                        ),

                        UnderlinedButtonWidget(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          text: "CHANGE THE PHONE NUMBER",
                        ),

                        SizedBox(
                          height: 16,
                        ),

                        // TextFormWidget(controller: _phoneController,),
                        Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                PinTextWidget(controller: _controller1),
                                PinTextWidget(controller: _controller2),
                                PinTextWidget(controller: _controller3),
                                PinTextWidget(controller: _controller4),
                                PinTextWidget(controller: _controller5),
                                PinTextWidget(controller: _controller6),
                              ]),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextBoldWidget(
                          color: Colors.black,
                          text: "IF THE OTP IS NOT RECIEVED",
                          fontsize: 20,
                        ),

                        SizedBox(
                          height: 15.0,
                        ),

                        ArgonTimerButton(
                          initialTimer: 60, // Optional
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.45,
                          minWidth: MediaQuery.of(context).size.width * 0.30,
                          color: Color(0xff3994c3),
                          borderRadius: 5.0,
                          child: Text(
                            "Resend OTP",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          ),
                          loader: (timeLeft) {
                            return Text(
                              "Resend in | $timeLeft",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            );
                          },
                          onTap: (startTimer, btnState) {
                            if (btnState == ButtonState.Idle) {
                              startTimer(60);
                              //TODO:resend code btn logic needs to be added
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ButtonWidget(
                    onPressed: (() async {
                      final code = _controller1.text.trim() +
                          _controller2.text.trim() +
                          _controller3.text.trim() +
                          _controller4.text.trim() +
                          _controller5.text.trim() +
                          _controller6.text.trim();
                      print("\n\n\n\n$code\n\n\n\n");

                      try {
                        AuthCredential credential =
                            PhoneAuthProvider.getCredential(
                                verificationId: verificationId,
                                smsCode: code.trim());

                        AuthResult result =
                            await _auth.signInWithCredential(credential);

                        FirebaseUser user = result.user;
                        if (user != null) {
                          Navigator.pushReplacementNamed(
                              context, PermissionPage.id);
                          print('\n\n\n\nsuccess\n\n\n\n');
                        } else {
                          print("\n\n\n\nError\n\n\n\n");
                          Navigator.pushReplacementNamed(context, Signup.id);
                        }
                      } catch (e) {
                        print('Error : $e');
                        invalidOTP();
                        _controller1.clear();
                        _controller2.clear();
                        _controller3.clear();
                        _controller4.clear();
                        _controller5.clear();
                        _controller6.clear();
                      }
                    }),
                    text: "LOGIN",
                  ),
                  SizedBox(
                    height: 10,
                  )
                ]),
          ),
        ));
  }
}
