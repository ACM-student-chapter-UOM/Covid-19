import 'package:flutter/material.dart';
import 'package:share/share.dart';
import '../components/app_bar.dart';
import '../components/text.dart';
import '../components/button.dart';

class ThankYouPage extends StatelessWidget {
  static const String id = "thank";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(),
        centerTitle: true,
      ),
      body: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
            SizedBox(
              height: 10,
            ),
            TextBoldWidget(
              color: Theme.of(context).accentColor,
              text: "THANK YOU FOR\n YOUR HELLP!",
              fontsize: 40.0,
            ),
            Image.asset(
              'images/Main2.png',
              fit: BoxFit.contain,
              height: 400,
            ),
            Column(children: <Widget>[
              Builder(
                builder: (BuildContext context) {
                  return ButtonWidget(
                    text: "SHARE THE APP",
                    onPressed: () {
                      final RenderBox box = context.findRenderObject();
                      Share.share("text", //todo: add app url to this
                          // subject: subject,
                          sharePositionOrigin:
                              box.localToGlobal(Offset.zero) & box.size);
                    },
                  );
                },
              ),
              UnderlinedButtonWidget(
                onPressed: () => {},
                text: "CLOSE",
              )
            ])
          ])),
    );
  }
}
