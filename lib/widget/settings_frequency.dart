import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_me/models/test_config.dart';
import 'package:word_me/widget/settings_frequency_item_picker.dart';

class SettingsFrequency extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TestConfig testConfig = Provider.of<TestConfig>(context);
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              child: SizedBox(
            height: 300,
            width: 250,
            child: ListView.builder(
              itemCount: testConfig.numberOfTimeADays,
              itemBuilder: (context, i) {
                return SettingsFrequencyItemPicker(i);
              },
            ),
          ))
        ]),
        RaisedButton.icon(
            onPressed: () => testConfig.addFrequency(),
            icon: Icon(Icons.add_alarm),
            label: Text('add'))
      ],
    );
  }
}
