import 'package:flutter/material.dart';
import 'package:word_me/models/test_config.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SettingsWordAtTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TestConfig testConfig = Provider.of<TestConfig>(context);
    return Container(
      child: TextField(
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            WhitelistingTextInputFormatter.digitsOnly
          ],
          decoration: InputDecoration(
              hintText: "wordsAtTest ${testConfig.wordsAtTest}"),
          onSubmitted: (String wordsAtTest) {
            print(wordsAtTest);
            try {
              int numWordsAtTest = int.parse(wordsAtTest);
              if (numWordsAtTest > 0) {
                testConfig.wordsAtDay = numWordsAtTest;
              }
            } catch (e) {
              print(e.toString());
            }
          }),
    );
  }
}
