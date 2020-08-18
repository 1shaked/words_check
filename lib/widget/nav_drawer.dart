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
            title: Text("Settings"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context).pushNamed('/settings');
            },
          ),
        ],
      ),
    );
  }
}
