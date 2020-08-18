import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_me/models/test_config.dart';
import 'package:word_me/widget/nav_drawer.dart';
import 'package:word_me/widget/settings_word_at_test.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TestConfig()),
      ],
      child: Scaffold(
        appBar: AppBar(title: Text('Settings')),
        drawer: NavDrawer(),
        body: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // here will be the name
              Column(children: [SettingsName()]),
            ],
          ),
        ),
      ),
    );
  }
}
