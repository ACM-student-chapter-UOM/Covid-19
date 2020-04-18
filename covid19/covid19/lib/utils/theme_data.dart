import 'package:flutter/material.dart';

var themeData = ThemeData(
  primaryColor: Color(0xff3994c3),
  accentColor: Color(0xff7abfe9),
  snackBarTheme: SnackBarThemeData(
    backgroundColor: Color(0xff3994c3),
    elevation: 1,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    contentTextStyle: TextStyle(
      color: Colors.white,
    ),
  ),
  fontFamily: 'Manrope',
);
