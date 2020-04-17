import 'package:flutter/material.dart';
import '../components/app_bar.dart';
import '../components/text.dart';
import './signup.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(),
        
        centerTitle: true,
      ),

      body: Container(
        child: Column(
          children:<Widget>[
             Image.asset(
                 'images/team.jpg',
                  fit: BoxFit.contain,
                  height: 150,
              ),

              
              TextBoldWidget(color: Theme.of(context).accentColor,text: "YOU ARE JUST A SINGLE TAP AWAY FROM \n BEGIN A PART OF THE LARGE \n FORCE TO STOP COVID-19 FROM \n SPREAD IN SRI LANKA",),

              SizedBox(height: 10,),

              SizedBox(
                height: 10.0,
                child:  Center(
                  child:  Container(
                    margin:  EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                    height: 5.0,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),

              SizedBox(height: 10,),

              TextBoldWidget(color:  Colors.black , text:  "BY TURNING BLUETOOTH IN YOUR PHONE, \n WE CAN HELP YOU FASTER IF \n YOU HAD CLOSE \n CONTACT WITH A COVID-19 CASE.",),
              
            
              TextSmallWidget(color: Theme.of(context).accentColor,text: "YOUR DATA WILL NOT BE ACCESSED \n UNLESS YOU WHERE NEAR A CONFORMED CASE",),
             
             Container(
                width: double.infinity,
                child: FlatButton(
                  child: Text("I WANT TO GIVE A HAND"),
                  textColor: Colors.white,
                  padding: EdgeInsets.all(16),
                  onPressed: () =>{
                    Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Signup()))
                  },
                  color: Theme.of(context).primaryColor,
                )
            ),
          ]
        )
      ),

      
    );
  }
}