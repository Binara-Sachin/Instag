import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';

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
