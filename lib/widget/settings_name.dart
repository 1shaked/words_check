import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_me/models/test_config.dart';

class SettingsName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TestConfig testConfig = Provider.of<TestConfig>(context);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.red[100], //                   <--- border color
          width: 1.0,
        ),
      ),
      padding: EdgeInsets.all(16.0),
      child: TextFormField(
        decoration:
            InputDecoration(hintText: "Your name is ${testConfig.name}"),
        // The validator receives the text that the user has entered.
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
      ),
    );
  }
}
