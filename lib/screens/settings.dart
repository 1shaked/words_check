import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_me/models/test_config.dart';
import 'package:word_me/widget/nav_drawer.dart';
import 'package:word_me/widget/settings_frequency.dart';
import 'package:word_me/widget/settings_name.dart';

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // here will be the name
              Expanded(flex: 5, child: SettingsName()),
              Expanded(flex: 5, child: SettingsFrequency()),
            ],
          ),
        ),
      ),
    );
  }
}
