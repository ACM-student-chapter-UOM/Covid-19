import 'package:flutter/material.dart';
import '../db_manager/athentication.dart';

import '../components/app_bar.dart';
import '../components/text.dart';
import '../components/button.dart';
import '../components/textform.dart';

class Signup extends StatelessWidget {
  static const String id = "signup";
  final TextEditingController _phoneController = TextEditingController();
  final AuthenticationManager authenticationManager = AuthenticationManager();

  
  @override
  Widget build(BuildContext context) {
      var appBar = AppBar(
        title: AppBarTitle(),
        
        centerTitle: true,
      );
      var _pageSize = MediaQuery.of(context).size.height;
      var _notifySize = MediaQuery.of(context).padding.top;
      var _appBarSize = appBar.preferredSize.height;
    

    return Scaffold(
      appBar: appBar,   
      body: SingleChildScrollView(
      child:Container(
         height: _pageSize - (_appBarSize + _notifySize),
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children:<Widget>[
            SizedBox(
                  height: 16,
                ),
            Form(
            child: Column(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: <Widget>[
                TextBoldWidget(color: Theme.of(context).primaryColor, text:"ENTER YOUR MOBILE NUMBER",fontsize: 20,), 

                
                SizedBox(
                  height: 16,
                ),

                TextFormWidget(controller: _phoneController,),

                SizedBox(
                  height: 16,
                ),
                TextBoldWidget(color: Colors.black,text: "YOUR PHONE NUMBER WILL BE \n USED TO CONTACT YOU IF YOU  \n WHERE NEAR A CONFIRMED CASE", fontsize: 20,),
              
              ],
            ),
          ),
            Image.asset(
                'images/phone.png',
                fit: BoxFit.contain,
                height: 300,
            ),

            Column(
              children: <Widget>[
                TextSmallWidget(color: Theme.of(context).accentColor,text: "WE WILL SEND YOU OTP TO CONFIRM\nYOUR PHONE NUMBER",),
             
                 SizedBox(height: 10,),

                ButtonWidget(
                  onPressed: (() async {

                    try {
                      String phone = _phoneController.text.trim();
                      await authenticationManager.loginUser(phone, context);
                    } catch (e) {
                      print(e);
                    }
                  }),
                  text: "LOGIN",
                ),
                SizedBox(height: 10,),
              ]
            )
                
          
          ]
        ),
      ),
    ));
  }
}
