import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget({@required this.onPressed, this.text});
  final GestureTapCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
          width: double.infinity,
          child: FlatButton(
            child: Text(
              text,
              style: TextStyle(
                letterSpacing: 1.5,
              ),
            ),
            textColor: Colors.white,
            padding: EdgeInsets.all(16),
            onPressed: onPressed,
            color: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          )),
    );
  }
}

class UnderlinedButtonWidget extends StatelessWidget {
  UnderlinedButtonWidget({@required this.onPressed,this.text});
  final GestureTapCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w400,
              color: Theme.of(context).primaryColor
            ),
          ),
        );
  }
}

