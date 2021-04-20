import 'package:flutter/material.dart';
import 'package:khabr/View/privacyPolicy.dart';

import 'about.dart';

class DrawerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          ListTile(
            title: Text(
              "About",
              style: TextStyle(fontSize: 18),
            ),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (c) => About())),
          ),
          ListTile(
            title: Text(
              "Privacy Policy",
              style: TextStyle(fontSize: 18),
            ),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (c) => Privacy())),
          ),
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
