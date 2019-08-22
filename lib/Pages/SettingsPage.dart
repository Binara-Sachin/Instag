import 'package:flutter/material.dart';
import 'package:insta_hashtag/Libraries/NavigationDrawerBuilder.dart';
import 'package:insta_hashtag/Pages/AboutPage.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Colors.blueAccent,
      ),
      drawer: NavigationDrawerBuilder(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
              child: Text(
                "About",
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.lightBlueAccent,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            ListTile(
              title: Text(
                "App Version",
                style: TextStyle(fontSize: 16.0),
              ),
              trailing: Text(
                "0.1.0",
                style: TextStyle(fontSize: 15.0, color: Colors.grey),
              ),
            ),
            ListTile(
              title: Text(
                "License info",
                style: TextStyle(fontSize: 16.0),
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LicensePage()),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
              child: Text(
                "Wii Tech",
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.lightBlueAccent,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            ListTile(
              title: Text(
                "About Us",
                style: TextStyle(fontSize: 16.0),
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutPage()),
              ),
            ),
            ListTile(
              title: Text(
                "Send Feedback",
                style: TextStyle(fontSize: 16.0),
              ),
              onTap: () => launchURL(),
            ),
          ],
        ),
      ),
    );
  }

  launchURL() async {
    const url = 'mailto:wiitechlk@gmail.com?subject=Insta Hashtags - Feedback&body=';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }
  
}
