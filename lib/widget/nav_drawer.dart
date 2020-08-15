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
              // Navigator.push
            },
          ),
          ListTile(
            title: Text("Item 2"),
            trailing: Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}
