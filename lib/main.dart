import 'dart:async';
import 'package:flutter/material.dart';
import 'package:khabr/Controller/passwordController.dart';
import 'package:khabr/View/loginScreen.dart';

import 'View/homeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'khaBr',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: LogoPage(),
    );
  }
}

class LogoPage extends StatefulWidget {
  @override
  _LogoPageState createState() => _LogoPageState();
}

class _LogoPageState extends State<LogoPage> {
  void initState() {
    super.initState();
    checkIfLogin();
  }

  Future<void> checkIfLogin() async {
    bool isSignin = await PasswordController.isSignin();
    bool isLoggedOut = await PasswordController.checkLoggedOut();
    print("isLoggedOut $isLoggedOut");
    print("isSignin $isSignin");
    if (isSignin && isLoggedOut) {
      Timer(
          Duration(seconds: 3),
          () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (c) => HomeScreen())));
    } else {
      Timer(
          Duration(seconds: 3),
          () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (c) => LoginScreen())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/khaBr.png'),
      ),
    );
  }
}
