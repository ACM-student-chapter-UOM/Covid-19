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

class TextwithIconWidget extends StatelessWidget {
   TextwithIconWidget({
     this.text,
    this.color,
    this.fontsize,
    this.icon
   });
  final String text;
  final Color color;
  final double fontsize;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
        child:Row(
          children: <Widget>[
            
            icon,

            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: fontsize,
                  fontWeight: FontWeight.w700,
                  color: color),
    )         
            )
            
          ],
      )
    );
  }
}