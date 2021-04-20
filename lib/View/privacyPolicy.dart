import 'package:flutter/material.dart';

class Privacy extends StatefulWidget {
  @override
  _PrivacyState createState() => _PrivacyState();
}

class _PrivacyState extends State<Privacy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy Policy"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Image.asset('assets/images/privacy.jpg'),
          Text("I dont use any of your personal data for any purpose.",
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
          Text(
              "Security of your data is important to me, but I cannot guarantee its absolute security.",
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
          Text(
              "The service may contain links to other websites that are not operated by me. If you click on a third party link, You will be directed to that third party's site. I strongly advise you to review the Privacy Policy of every site you visit. I have no control over and assume no responsibility for the content, privacy policies or practices of any third party sites or services.",
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
          Text(
              "If you have any questions about this Privacy Policy, You can contact me: By email: theomkale@gmail.com,",
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic))
        ]),
      ),
    );
  }
}
