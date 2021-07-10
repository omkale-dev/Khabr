import 'dart:io';

import 'package:flutter/material.dart';
import 'package:khabr/Controller/passwordController.dart';
import 'package:khabr/View/homeScreen.dart';
import 'package:khabr/View/signUpScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String password;
  String email;

  //if signin or forgot password
  Future<Widget> isSignOrForgot() async {
    bool isSignin = await PasswordController.isSignin();

    if (isSignin) {
      return GestureDetector(
        onTap: () {
          //go to register page
          Navigator.push(
              context, MaterialPageRoute(builder: (c) => SignUpScreen()));
        },
        child: Text(
          "Forgot password",
          style: TextStyle(
            color: Colors.blue[900],
            decoration: TextDecoration.underline,
          ),
        ),
      );
    } else {
      return GestureDetector(
        onTap: () {
          //go to register page
          Navigator.push(
              context, MaterialPageRoute(builder: (c) => SignUpScreen()));
        },
        child: Text(
          "New here, Sign UP",
          style: TextStyle(
            color: Colors.blue[900],
            decoration: TextDecoration.underline,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person,
              size: 150,
              color: Colors.green,
            ),
            Text(
              "User Login",
              style: TextStyle(fontSize: 30),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: "Email Address",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w300,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 2.0, color: Colors.green),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 2.0, color: Colors.red),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 2.0, color: Colors.red),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      validator: (text) {
                        if (text != null &&
                            text.isNotEmpty &&
                            RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                .hasMatch(text)) {
                          email = text;
                        } else {
                          return 'Enter Valid Email';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      obscureText: true,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w300,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 2.0, color: Colors.green),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 2.0, color: Colors.red),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 2.0, color: Colors.red),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      validator: (text) {
                        if (text != null &&
                            text.isNotEmpty &&
                            text.length >= 4) {
                          password = text;
                        } else {
                          return 'Enter Valid Password';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    //login creds were valid
                    bool status = await PasswordController.checkPassword(
                        password: password, email: email);

                    if (status) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (c) => HomeScreen()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Please enter valid credentials")));
                    }
                  }
                },
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            FutureBuilder(
              builder: (ctx, snapshot) {
                return snapshot.data ??
                    Center(
                      child: CircularProgressIndicator(),
                    );
              },
              future: isSignOrForgot(),
            ),
          ],
        ),
      ),
    );
  }
}
