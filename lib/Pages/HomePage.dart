import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import 'package:insta_hashtag/Assets/Class_HashtagList.dart';
import 'package:insta_hashtag/Assets/Variable_currentClipboardData.dart';

import 'package:insta_hashtag/Libraries/ExpansionViewBuilder.dart';
import 'package:insta_hashtag/Libraries/NavigationDrawerBuilder.dart';
import 'package:insta_hashtag/Pages/SettingsPage.dart';

import 'SpecificHashtagsPage.dart';

Future<String> fetchData() async {
  print("Start fething data");

  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      print('connected');
    }
  } on SocketException catch (_) {
    return "Oops ! Seems like we can't conncet to the Internet";
  }

  final response = await http.get('http://wiitech.pythonanywhere.com/');

  if (response.statusCode == 200) {
    String list = json.decode(response.body).toString();
    list = list.substring(2, list.length-2);
    List<String> list2 = list.split('], [');

    for (var i = 0; i < 9; i++) {
      list2[i].trim();
      List<String> tempHashtagList = list2[i].split(', ');
      hashtagObjectList[i].hashtagList = tempHashtagList;
    }

    return "Parse successful";
  } 
  else {
    return "Failed to load post";
  }
}

class HomePage extends StatefulWidget {
  final Future<String> result;

  const HomePage({Key key, this.result}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    SpecificHashtagsPage(pageTitle: "Copied Hashtags", displayList: currentClipboardData),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _onPushRefresh() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage(result: fetchData())),
      
    );
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: _selectedIndex==0 ? hashtagListMain() : _widgetOptions.elementAt(_selectedIndex-1),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.content_copy),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text(''),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blueAccent,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  Widget hashtagListMain(){
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.blueAccent,
        title: new Text("Insta Hashtags"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            tooltip: "Refresh",
            onPressed: () => _onPushRefresh(),
          ),
          Container(width: 15.0),
        ],
      ),
      drawer: NavigationDrawerBuilder(),
      body: Center(
        child: FutureBuilder<String>(
          future: widget.result,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data);

              if (snapshot.data == "Parse successful"){
                return ExpansionViewBuilder();
              }
              else if (snapshot.hasError) {
                print("${snapshot.error}");
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.error,
                      color: Colors.grey,
                      size: 50.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Something went wrong"),
                    ),
                  ],
                );
              }
              
              else{
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.error,
                      color: Colors.grey,
                      size: 50.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(snapshot.data),
                    ),
                  ],
                );
              } 
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
