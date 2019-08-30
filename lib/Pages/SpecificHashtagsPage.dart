import 'package:flutter/material.dart';

import 'package:Instag/Libraries/HashtagListBuilder.dart';

class SpecificHashtagsPage extends StatefulWidget {
  final String pageTitle;
  final List<String> displayList;

  const SpecificHashtagsPage({Key key, this.displayList, this.pageTitle}) : super(key: key);

  @override
  _SpecificHashtagsPageState createState() => _SpecificHashtagsPageState();
}

class _SpecificHashtagsPageState extends State<SpecificHashtagsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(widget.pageTitle),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              HashtagListBuilder(widget.displayList),
            ],
          ),
        ],
      ),
    );
  }
}
