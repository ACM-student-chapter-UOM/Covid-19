import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  TextFormWidget({@required this.controller});
  final TextEditingController controller;

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
                fontWeight: FontWeight.w800,
                color: Theme.of(context).accentColor,
                fontSize: 15),
          ),
          keyboardType: TextInputType.phone,
          validator: (value) {
            return _phoneNumberValidator(value);
          },
          controller: controller,
        ),
      ),
    );
  }

  String _phoneNumberValidator(String number) {
    try {
      int n = int.parse(number);
      if (n.toString().length == 10) {
        return null;
      }
      return 'Invalid Phone Number';
    } catch (e) {
      return 'Invalid Phone Number';
    }
  }
}
