import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_me/models/test_config.dart';

class SettingsSave extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TestConfig testConfig = Provider.of<TestConfig>(context);

    return RaisedButton.icon(
        onPressed: () => testConfig.updateFileConfig(),
        icon: Icon(Icons.save),
        label: Text('save'));
  }
}
