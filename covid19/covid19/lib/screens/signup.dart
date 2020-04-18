import 'package:flutter/material.dart';
import '../db_manager/athentication.dart';

import '../components/app_bar.dart';
import '../components/text.dart';
import '../components/button.dart';
import '../components/textform.dart';

class Signup extends StatelessWidget {
  static const String id = "signup";
  final TextEditingController _phoneController = TextEditingController();
  final AuthenticationManager authenticationManager = AuthenticationManager();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: AppBarTitle(),
      centerTitle: true,
    );
    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20.0,
          bottom: 8,
          left: 8,
          right: 8,
        ),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      TextBoldWidget(
                        color: Theme.of(context).primaryColor,
                        text: "ENTER YOUR MOBILE NUMBER",
                        fontsize: 16,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextFormWidget(
                        controller: _phoneController,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextBoldWidget(
                        color: Colors.black,
                        text:
                            "YOUR PHONE NUMBER WILL BE \n USED TO CONTACT YOU IF YOU  \n WHERE NEAR A CONFIRMED CASE",
                        fontsize: 16,
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  'images/phone.png',
                  fit: BoxFit.contain,
                  height: 200,
                ),
                SizedBox(
                  height: 20,
                ),
                Column(children: <Widget>[
                  TextSmallWidget(
                    color: Theme.of(context).accentColor,
                    text: "WE WILL SEND YOU OTP TO CONFIRM\nYOUR PHONE NUMBER",
                  ),
                  ButtonWidget(
                    onPressed: (() async {
                      if (_formKey.currentState.validate()) {
                        try {
                          String phone = _phoneController.text.trim();
                          await authenticationManager.loginUser(phone, context);
                        } catch (e) {
                          
                        }
                      }
                    }),
                    text: "LOGIN",
                  ),
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
