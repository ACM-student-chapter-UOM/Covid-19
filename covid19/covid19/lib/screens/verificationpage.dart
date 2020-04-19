import 'package:flutter/material.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';

import '../components/app_bar.dart';
import '../components/text.dart';
import '../components/button.dart';
import '../components/textform.dart';

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

  @override
  Widget build(BuildContext context) {
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
                          onPressed: () => {},
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

                        UnderlinedButtonWidget(
                          onPressed: () => {},
                          text: "RESEND THE CODE",
                        ),
                      ],
                    ),
                  ),
                  Column(children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    ButtonWidget(
                      onPressed: () => {},
                      text: "LOGIN",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ])
                ]),
          ),
        ));
  }
}
