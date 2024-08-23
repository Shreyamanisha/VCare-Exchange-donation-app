import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'authpage.dart';
import 'homepage.dart';
import 'login.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override

  bool logstatus(){
    User? user = FirebaseAuth.instance.currentUser;
    if(user!=null){
      return true;
    }
    else{
      return false;
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VCare Exchange',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: AuthPage(),
      routes: {
        '/home': (context) => MyHomePage(),
      },
    );

  }
}



Widget _buildPage(String content) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        content,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    body: Center(
      child: Text(
        'Content for $content Page',
        style: TextStyle(
          fontSize: 18.0,
        ),
      ),
    ),
  );
}
