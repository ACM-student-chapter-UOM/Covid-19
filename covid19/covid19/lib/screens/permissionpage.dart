import 'package:flutter/material.dart';
import '../components/app_bar.dart';
import '../components/text.dart';
import '../components/button.dart';
// import './signup.dart';
// import 'signup.dart';

class PermissionPage extends StatelessWidget {
  static const String id = "permission";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(),
        
        centerTitle: true,
      ),

      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:<Widget>[

              SizedBox(height: 10,),
              TextBoldWidget(color: Theme.of(context).accentColor,text: "APP PERMISSIONS",fontsize: 22.0,),

             Image.asset(
                 'images/phone.png',
                  fit: BoxFit.contain,
                  height: 200,
              ),

            Padding(
              padding:  EdgeInsets.all(16.0),

               child: Column(
              children: <Widget>[
                  TextwithIconWidget(color: Colors.black,text: "Allow <app name> to access Bluetooth",icon: Icon(Icons.bluetooth),fontsize: 20,),

                  SizedBox(height: 16,),

                  TextwithIconWidget(color: Colors.black,text: "Allow <app name> to send notifications",icon: Icon(Icons.notifications),fontsize: 20,),

                  SizedBox(height: 16,),

                  TextwithIconWidget(color: Colors.black,text: "Allow <app name> to store your mobile number in a secured registry",icon: Icon(Icons.save
                  ),fontsize: 20,),

                  SizedBox(height: 16,),
            ],),
              
              
              
              ),      

              
            Column(
              children: <Widget>[
                

                ButtonWidget(
                  onPressed: ()=>{},
                  text: "I ACCEPT",
                  ),
               
                 SizedBox(height: 10,),
                  ]
            )
              
              
            
          ]
        )
      ),

      
    );
  }
}