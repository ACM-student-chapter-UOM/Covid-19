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
        child:  TextFormField(
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color:Theme.of(context).accentColor)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: Theme.of(context).accentColor)),
              filled: true,
              fillColor: Colors.grey[100],
              prefixIcon:Icon(
                Icons.phone
              ),
              hintText: "Phone number",
              hintStyle:
                TextStyle(
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).accentColor,
                  fontSize: 15
                  ),
                
              ),
          controller: controller,
        ),
    ),
    );
  }
}

class PinTextWidget extends StatelessWidget {

  PinTextWidget({@required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    int maxLength= 1;
    String text = "";

    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Container(
      
        width: 40.0,
        child:  TextFormField(
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color:Theme.of(context).accentColor)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: Theme.of(context).accentColor)),
              filled: true,
              fillColor: Colors.grey[100],
              hintStyle:
                TextStyle(
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).accentColor,
                  fontSize: 15
                  ),
                
              ),
          controller: controller,
          onChanged: (String newVal) {
            if(newVal.length <= maxLength){
                text = newVal;
            }else{
                controller.text = text;
            }

        }
        ),
    ),
    );
  }
} 