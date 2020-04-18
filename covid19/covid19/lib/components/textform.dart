import 'package:flutter/material.dart';

class TextFormWidget extends StatefulWidget {
  TextFormWidget({@required this.controller});
  final TextEditingController controller;

  @override
  _TextFormWidgetState createState() => _TextFormWidgetState();
}

class _TextFormWidgetState extends State<TextFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Container(
        width: double.infinity,
        child: TextFormField(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: Theme.of(context).accentColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: Theme.of(context).errorColor),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: Theme.of(context).errorColor),
            ),
            filled: true,
            fillColor: Theme.of(context).accentColor.withOpacity(0.05),
            prefixIcon: Icon(
              Icons.phone,
              color: Theme.of(context).accentColor,
            ),
            hintText: "Phone Number",
            hintStyle: TextStyle(
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w600,
              color: Theme.of(context).accentColor.withOpacity(0.75),
              fontSize: 15,
            ),
          ),
          
          keyboardType: TextInputType.phone,
          cursorColor: Theme.of(context).accentColor,
          style: TextStyle(
            fontSize: 20,
          ),
          validator: (value) {
            return _phoneNumberValidator(value);
          },
          controller: widget.controller,
        ),
      
      ),
    );
  
  }

  String _phoneNumberValidator(String number) {
    print(number);
    try {
      int n = int.parse(number);
      print(number);
      if (number.length == 10) {
        return null;
      }
      return 'Invalid Phone Number1';
    } catch (e) {
      return 'Invalid Phone Number';
    }
  }
}
