import 'package:flutter/material.dart';
import 'package:word_me/models/test_config.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SettingsWordAtTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TestConfig testConfig = Provider.of<TestConfig>(context);
    return Container(
      child: TextFormField(
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          WhitelistingTextInputFormatter.digitsOnly
        ],
        decoration:
            InputDecoration(hintText: "wordsAtTest ${testConfig.wordsAtTest}"),
        validator: (value) {
          return int.parse(value) < 1
              ? 'pls enter a value bigger then 0'
              : null;
        },
      ),
    );
  }
}
