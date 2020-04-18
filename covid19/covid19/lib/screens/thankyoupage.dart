import 'package:flutter/material.dart';
import '../components/app_bar.dart';
import '../components/text.dart';
import '../components/button.dart';

class ThankYouPage extends StatelessWidget {
   static const String id = "thank";

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
              TextBoldWidget(color: Theme.of(context).accentColor,text: "THANK YOU FOR\n YOUR HELLP!",fontsize: 40.0,),

             Image.asset(
                 'images/Main2.png',
                  fit: BoxFit.contain,
                  height: 400,
              ),

            
              
            Column(
              children: <Widget>[
                

                ButtonWidget(
                  onPressed: ()=>{},
                  text: "SHARE THE APP",
                  ),
               
                 UnderlinedButtonWidget(onPressed: ()=>{},text: "CLOSE",)
                  ]
            )
              
              
            
          ]
        )
      ),

      
    );
  }
}