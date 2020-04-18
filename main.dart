import 'package:flutter/material.dart';
import 'package:flutter_string_encryption/flutter_string_encryption.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter login UI',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  // final TextEditingController _emailFilter = new TextEditingController();
  // final TextEditingController _passwordFilter = new TextEditingController();
  // // final Listener _emailListen = new Listener();
  // // final Listener _passwordListen = new Listener();
  var _number;
  String _randomKey = 'Unknown';
  String _encrypted = "Unknown";
  String _decrypted = "Unknown";

  final numbercon=new TextEditingController();
  
  initPlatformState() async {
    final cryptor = new PlatformStringCryptor();

    final key = await cryptor.generateRandomKey();

    final string = _number;
    final encrypted = await cryptor.encrypt(string, key);
    // final decrypted = await cryptor.decrypt(encrypted, key);
    final decrypted = await cryptor.decrypt(encrypted, key);
    setState(() {
      _randomKey = key;
      _encrypted = encrypted;
      _decrypted= decrypted;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
       child: Padding(
         padding: const EdgeInsets.all(10.0),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             TextField(
               controller: numbercon,
               keyboardType: TextInputType.number,
               decoration: InputDecoration(
                 hintText: "Enter your number",
               ),
             ),
             RaisedButton(
               onPressed: (){
                 setState(() {
                   _number= numbercon.text;
                   initPlatformState();
                 });
               },
               child: Text('Submit'),
             ),
             Text("$_number"),
             Text("           "),
             Text("$_randomKey"),
             Text("           "),
             Text("$_encrypted"),
             Text("           "),
             Text("$_decrypted"),
           ],
         ),
       ),
        
      ),
// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
