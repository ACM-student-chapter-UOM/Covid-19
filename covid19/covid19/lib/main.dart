import 'package:flutter/material.dart';

import 'screens/infopage.dart';
import 'screens/permissionpage.dart';
import 'screens/signup.dart';
import 'screens/thankyoupage.dart';
import 'screens/verificationpage.dart';
import 'utils/theme_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid 19',
      theme: themeData,
      debugShowCheckedModeBanner: false,
      // todo: add info page as the default router
      initialRoute: InfoPage.id,
      routes: {
        InfoPage.id: (context) => InfoPage(), //first
        Signup.id: (context) => Signup(), // enters mobile num here
        VerificationPage.id: (context) => VerificationPage(), //enters pin here
        ThankYouPage.id: (context) => ThankYouPage(), // thank you page
        PermissionPage.id: (context) =>
            PermissionPage(), // bluetooth permission
      },
    );
  }
}
