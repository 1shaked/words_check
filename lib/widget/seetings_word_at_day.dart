import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_me/models/test_config.dart';
import 'package:flutter/services.dart';

class SettingsWordAtDay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TestConfig testConfig = Provider.of<TestConfig>(context);
    return Container(
      child: TextField(
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          WhitelistingTextInputFormatter.digitsOnly
        ],
        decoration:
            InputDecoration(hintText: "wordsAtDay ${testConfig.wordsAtDay}"),
        onSubmitted: (String s) {
          try {
            int wordsAtDay = int.parse(s);
            if (wordsAtDay > 0) {
              testConfig.wordsAtDay = wordsAtDay;
            }
          } catch (e) {
            print(e.toString());
          }
        },
      ),
    );
  }
}
