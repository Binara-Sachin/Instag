import 'dart:math';

import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';

import 'Assets/Class_HashtagList.dart';
import 'Libraries/AdmobLibraries.dart';
import 'Pages/HomePage.dart';

void main() {
  Admob.initialize(getAppId());
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    int ad01index = new Random().nextInt(hashtagObjectList.length);
    hashtagObjectList.insert(ad01index, new HashtagList("Ad Here", ["000"]));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instag',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        
      ),
      home: HomePage(result: fetchData()),
      routes: {
        "/home": (_) => new HomePage(result: fetchData()),
      },
    );
  }
}
