// import 'package:covid19/screens/homepage.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:covid19/screens/homepage.dart';
import 'package:flutter/material.dart';
import './screens/signup.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: WelcomeScreen(),
      initialRoute: Signup.id,
      routes: {
        Signup.id: (context) => Signup(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
      },
    );
  }
}
