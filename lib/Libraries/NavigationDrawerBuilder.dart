import 'package:flutter/material.dart';
import 'package:insta_hashtag/Assets/Class_HashtagList.dart';
import 'package:insta_hashtag/Pages/HomePage.dart';
import 'package:insta_hashtag/Pages/SpecificHashtagsPage.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:insta_hashtag/Pages/AboutPage.dart';


class DrawerItem {
  String title;
  IconData icon;
  bool tabbed;
  DrawerItem(this.title, this.icon, this.tabbed);
}

final drawerItemsMain = [
  new DrawerItem("All Hashtags", Icons.list, false),
  new DrawerItem("Popular Hashtags", Icons.label_outline, true),
  new DrawerItem("Follow Hashtags", Icons.label_outline, true),
  new DrawerItem("Like Hashtags", Icons.label_outline, true),
  new DrawerItem("Food Hashtags", Icons.label_outline, true),
  new DrawerItem("Music Hashtags", Icons.label_outline, true),
  new DrawerItem("Art Hashtags", Icons.label_outline, true),
  new DrawerItem("Animals Hashtags", Icons.label_outline, true),
  new DrawerItem("Cats Hashtags", Icons.label_outline, true),
  new DrawerItem("Dogs Hashtags", Icons.label_outline, true),
  new DrawerItem("About", Icons.info , false),
  new DrawerItem("Send Feedback", Icons.feedback, false)
];

class NavigationDrawerBuilder extends StatelessWidget {
  _getDrawerOptionsWidget(BuildContext context) {
    var drawerOptions = <Widget>[];

    for (var i = 0; i < drawerItemsMain.length; i++) {
      var drawerItem = drawerItemsMain[i];
      drawerOptions.add(new ListTile(
        leading: Icon(drawerItem.icon),
        title: new Text(drawerItem.title, style: new TextStyle(color: Colors.black54),),
        onTap: () => _onSelectItem(i, context),
      ));
    }
    return drawerOptions;
  }

  _onSelectItem(int index, BuildContext context) {
    switch (index) {
      case 0:
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage(result: fetchData())),
        );
        break;
      case 10:
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AboutPage()),
        );
        break;
      case 11:
        launchURL();
        break;
      default:
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SpecificHashtagsPage(pageTitle: hashtagObjectList[index-1].title, displayList: hashtagObjectList[index-1].hashtagList)),
        );
        break;
    }
  }

  launchURL() async {
    const url = 'mailto:wiitechlk@gmail.com?subject=Insta Hashtags - Feedback&body=';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  const NavigationDrawerBuilder({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.blueAccent),
            accountName: new Text(
              "Insta Hashtags",
              style: TextStyle(fontSize: 20.0),
            ),
            accountEmail: null,
          ),
          new Column(
            children: _getDrawerOptionsWidget(context),
          ),
        ],
      ),
    );
  }
}
