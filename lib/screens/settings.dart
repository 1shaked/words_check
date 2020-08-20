import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_me/models/test_config.dart';
import 'package:word_me/widget/nav_drawer.dart';
import 'package:word_me/widget/seetings_word_at_day.dart';
import 'package:word_me/widget/settings_frequency.dart';
import 'package:word_me/widget/settings_name.dart';
import 'package:word_me/widget/settings_save.dart';
import 'package:word_me/widget/settings_word_at_test.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final _settingsFormKey = GlobalKey<FormState>();

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
          child: Form(
            key: _settingsFormKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(flex: 5, child: SettingsWordAtDay()),
                    Expanded(flex: 5, child: SettingsWordAtTest()),
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Expanded(flex: 5, child: SettingsName()),
                ]),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Expanded(flex: 5, child: SettingsFrequency()),
                ]),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Expanded(flex: 5, child: SettingsSave()),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
