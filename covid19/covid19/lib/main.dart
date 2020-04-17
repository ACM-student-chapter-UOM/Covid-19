import 'package:covid19/screens/homepage.dart';
import 'package:covid19/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:covid19/screens/infopage.dart';

import 'screens/infopage.dart';

// import 'screens/infopage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xff3994c3),
        accentColor: Color(0xff7abfe9),
      ),
      // home: InfoPage(),

      // todo: add info page as the default router
      initialRoute: Signup.id,
      routes: {
        Signup.id: (context) => Signup(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
      },
    );
  }
}
