import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
                 'images/logo_4.png',
                  fit: BoxFit.contain,
                  height: 32,
              ),
            Text(
            "Covid - 19",
            style: TextStyle(
              fontFamily: 'Manrope',
              fontSize: 25.0,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],);
  }
}