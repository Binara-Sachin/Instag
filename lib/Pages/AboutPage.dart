import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          "This app is to easy select hashtags for a better social media reach especially in Instagram by WiiTech. You can navigate through different categories and copy hashtags into your clipboard which is related to those categories.",
          style: new TextStyle(
            fontSize: 16.0,
            color: Colors.black54,
          ),
        ),
      )
    );
  }
}