import 'package:flutter/material.dart';
import '../components/app_bar.dart';
import '../components/text.dart';
import '../components/button.dart';
// import './signup.dart';
// import 'signup.dart';

class InfoPage extends StatelessWidget {
  static const String id = "info";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'images/info.jpg',
                fit: BoxFit.contain,
                height: 190,
              ),
              Column(
                children: <Widget>[
                  TextBoldWidget(
                    color: Theme.of(context).primaryColor,
                    text:
                        "YOU ARE JUST A SINGLE TAP AWAY FROM \n BEGIN A PART OF THE LARGE \n FORCE TO STOP COVID-19 FROM \n SPREAD IN SRI LANKA",
                    fontsize: 16.0,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10.0,
                    child: Divider(
                      color: Theme.of(context).accentColor,
                      thickness: 2,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextBoldWidget(
                    color: Colors.black,
                    text:
                        "BY TURNING BLUETOOTH IN YOUR PHONE, \n WE CAN HELP YOU FASTER IF \n YOU HAD CLOSE \n CONTACT WITH A COVID-19 CASE.",
                    fontsize: 13,
                  ),
                
                ],
              ),
              Column(
                children: <Widget>[
                  TextSmallWidget(
                    color: Theme.of(context).accentColor,
                    text:
                        "YOUR DATA WILL NOT BE ACCESSED \n UNLESS YOU WHERE NEAR A CONFORMED CASE",
                    
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  ButtonWidget(
                    onPressed: () {
                      // Navigator.push( context,MaterialPageRoute(builder: (context) => Signup()));
                      Navigator.pushReplacementNamed(context, 'signup');
                    },
                    text: "I WANT TO GIVE A HAND",
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
