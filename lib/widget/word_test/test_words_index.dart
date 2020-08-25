import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_me/models/test_maneger.dart';

class TestWordsIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TestManeger testManeger = Provider.of<TestManeger>(context);
    return Container(
      child: Card(
          color: Colors.redAccent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                  'You did ${testManeger.testIndex} out of ${testManeger.maxIndex}',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25)),
              Text('${testManeger.testPrecent}%',
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 25))
            ],
          )),
    );
  }
}
