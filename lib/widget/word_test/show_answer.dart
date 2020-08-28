import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_me/models/test_maneger.dart';

class ShowAnswer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TestManeger testManeger = Provider.of<TestManeger>(context);
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: testManeger.showTranslation
          ? showAnswer(testManeger)
          : showUnknownBox(),
    );
  }

  Widget showAnswer(TestManeger testManeger) {
    return Card(
        color: Colors.black,
        child: Container(
          child: Text(testManeger.currentWord.translation,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 35, color: Colors.white)),
        ));
  }

  Widget showUnknownBox() {
    return Card(
        color: Colors.black,
        child: Container(
          child: Text('What am I ??',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 35, color: Colors.white)),
        ));
  }
}
