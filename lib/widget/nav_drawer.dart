import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text("Home page"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context).pushNamed('/');
            },
          ),
          ListTile(
            title: Text("known words"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context).pushNamed('/known');
            },
          ),
          ListTile(
            title: Text("unknown words"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context).pushNamed('/unknown');
            },
          ),
          ListTile(
            title: Text("all word dictionary"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context).pushNamed('/all_words');
            },
          ),
        ],
      ),
    );
  }
}
