import 'dart:math';

import 'package:Instag/Libraries/AdmobLibraries.dart';
import 'package:flutter/material.dart';

import 'package:Instag/Assets/Class_HashtagList.dart';

import 'HashtagListBuilder.dart';

class ExpansionViewBuilder extends StatefulWidget {
  @override
  _ExpansionViewBuilderState createState() => _ExpansionViewBuilderState();

}

class _ExpansionViewBuilderState extends State<ExpansionViewBuilder> {

  Widget _buildExpansionTile(HashtagList hashtagObject) {
    return new ExpansionTile(
      title: Text(
        hashtagObject.title,
      ),
      children: <Widget>[
          HashtagListBuilder(hashtagObject.hashtagList),
      ],
    );
  }

  Widget _buildExpansionView() {
    List<HashtagList> tempHashtagObjectList = hashtagObjectList;
    //int ad01index = new Random().nextInt(tempHashtagObjectList.length);
    //tempHashtagObjectList.insert(ad01index, new HashtagList("Ad Here", ["000"]));

    return new ListView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      padding: const EdgeInsets.all(8.0),
      itemCount: tempHashtagObjectList.length,
      itemBuilder: (context, i) {
        if (tempHashtagObjectList[i].title.toString() == "Ad Here") {
          return showBannerAd();
        }
        return _buildExpansionTile(tempHashtagObjectList[i]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildExpansionView();
  }
}