import 'package:flutter/material.dart';
import 'package:khabr/Controller/passwordController.dart';
import 'package:khabr/View/loginScreen.dart';
import 'package:khabr/View/privacyPolicy.dart';

import 'about.dart';

class DrawerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.info),
            title: Text(
              "About",
              style: TextStyle(fontSize: 18),
            ),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (c) => About())),
          ),
          ListTile(
            leading: Icon(Icons.privacy_tip),
            title: Text(
              "Privacy Policy",
              style: TextStyle(fontSize: 18),
            ),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (c) => Privacy())),
          ),
          ListTile(
              leading: Icon(Icons.logout),
              title: Text(
                "Logout",
                style: TextStyle(fontSize: 18),
              ),
              onTap: () => {
                    PasswordController.logout(),
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (c) => LoginScreen()))
                  }),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Made with ",
                style: TextStyle(fontSize: 16),
              ),
              Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              Text(
                " by OM",
                style: TextStyle(fontSize: 16),
              ),
            ],
          )
        ],
      ),
    );
  }
}
