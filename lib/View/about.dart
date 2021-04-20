import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Center(
              child: CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage(
                  'assets/images/Om.jpeg',
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Hey!, My name is Om Kale.\nI build khaBr app to learn about API\'s.\nI made use of NewsApi.org.\nI learned to fetch data from the Api and display it accordingly.\nI got to learn a lot while making this app.',
                style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
              ),
            ),
            Image.asset('assets/images/aboutMe.png'),
          ],
        ),
      ),
    );
  }
}
