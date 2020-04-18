import 'package:flutter/material.dart';

import 'screens/homepage.dart';
import 'screens/infopage.dart';
import 'screens/otppage.dart';
import 'screens/signup.dart';
import 'utils/theme_data.dart';

// import 'screens/infopage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeData,
      debugShowCheckedModeBanner: false,
      // todo: add info page as the default router
      initialRoute: InfoPage.id,
      routes: {
        InfoPage.id: (context) => InfoPage(),
        Signup.id: (context) => Signup(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        OtpPage.id: (context) => OtpPage()
      },
    );
  }
}
