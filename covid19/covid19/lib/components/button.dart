import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget({@required this.onPressed,this.text});
  final GestureTapCallback onPressed;
  final String text;
  
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
      
        width: double.infinity,
        child: FlatButton(
          child: Text(text),
          textColor: Colors.white,
          padding: EdgeInsets.all(16),
          onPressed: onPressed,
          color: Theme.of(context).primaryColor,
        )
    ),
    );
  }
}