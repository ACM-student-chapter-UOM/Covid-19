import 'dart:ffi';

import 'package:flutter/material.dart';

class TextSmallWidget extends StatelessWidget {
   const TextSmallWidget({
    Key key,
    this.text,
    this.color,
  }) : super(key: key);
  final String text;
  final Color color;


  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Manrope',
        fontWeight: FontWeight.w400,
        color: color),
    );
  }
}

class TextBoldWidget extends StatelessWidget {
   const TextBoldWidget({
    Key key,
    this.text,
    this.color,
    this.fontsize
  }) : super(key: key);
  final String text;
  final Color color;
  final double fontsize;


  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Manrope',
        fontSize: fontsize,
        fontWeight: FontWeight.w800,
        color: color),
    );
  }
}