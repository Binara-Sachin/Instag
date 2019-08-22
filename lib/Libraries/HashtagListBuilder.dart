import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:insta_hashtag/Assets/Variable_currentClipboardData.dart';

class HashtagListBuilder extends StatefulWidget {
  final List<String> hashtagList;

  HashtagListBuilder(this.hashtagList);

  @override
  _HashtagListBuilderState createState() => _HashtagListBuilderState();
}

class _HashtagListBuilderState extends State<HashtagListBuilder> {

  Widget _buildHashtagList() {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 8.0, // gap between adjacent chips
      runSpacing: 4.0, // gap between lines
      children: widget.hashtagList.map((item) => new HashtagTileBuilder(item.toString())).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildHashtagList();
  }
}

class HashtagTileBuilder extends StatefulWidget {
  final String hashtag;

  HashtagTileBuilder(this.hashtag);

  @override
  _HashtagTileBuilderState createState() => _HashtagTileBuilderState();
}

class _HashtagTileBuilderState extends State<HashtagTileBuilder> {
  @override
  Widget build(BuildContext context) {
    bool alreadyCopied = false;

    if (currentClipboardData.contains(widget.hashtag)) {
      alreadyCopied = true;
    }

    return Container(
      child: GestureDetector(
        onTap: () {
          /*
          Scaffold.of(context).hideCurrentSnackBar();
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text("Copied to Clipboard"),
            backgroundColor: Colors.blue,
          ));
          */
          setState(() {
            if (alreadyCopied) {
              currentClipboardData.remove(widget.hashtag);
            }
            else{
              currentClipboardData.add(widget.hashtag);
            }
            String toClipboard = "";
            currentClipboardData.forEach((tag){
              toClipboard += (tag + " ");
            });
            print(toClipboard);
            Clipboard.setData(new ClipboardData(text: toClipboard));
          });
        },
        child: Chip(
          backgroundColor: alreadyCopied ? Colors.blueAccent.shade100 : Colors.white,
          label: Text(widget.hashtag),
        ),
      ),
    );
  }
}