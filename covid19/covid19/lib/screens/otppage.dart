import 'package:covid19/components/app_bar.dart';
import 'package:covid19/components/text.dart';
import 'package:flutter/material.dart';

class OtpPage extends StatelessWidget {
  static const String id = "otppage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(),
      ),
      body: SingleChildScrollView(
        child: Container(
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
                      TextBoldWidget(
                        color: Theme.of(context).primaryColor,
                        text: "ENTER THE OTP SENT TO YOU",
                        fontsize: 20,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextBoldWidget(
                        color: Theme.of(context).accentColor,
                        text: "011 2729 729",
                        fontsize: 20,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      // 6 digit boxes
                      SizedBox(
                        height: 16,
                      ),
                      TextBoldWidget(
                        color: Colors.black,
                        text: "IF THE OTP IS NOT RECEIVED",
                        fontsize: 20,
                      ),
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
