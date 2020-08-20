import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_me/models/test_config.dart';

class SettingsFrequencyItemPicker extends StatelessWidget {
  final int index;
  SettingsFrequencyItemPicker(this.index);

  Future<Null> selectedTime(BuildContext context, TestConfig config) async {
    TimeOfDay time = await showTimePicker(
      initialTime: config.frequency[index],
      context: context,
    );
    print(time);
    config.changeFrequencyAtIndex(index, time);
  }

  @override
  Widget build(BuildContext context) {
    TestConfig testConfig = Provider.of<TestConfig>(context);
    return Container(
      child: Row(
        children: [
          Text(testConfig.frequency[index].toString()),
          RaisedButton(
              child: Icon(Icons.alarm),
              onPressed: () {
                selectedTime(context, testConfig);
              }),
        ],
      ),
    );
  }
}
